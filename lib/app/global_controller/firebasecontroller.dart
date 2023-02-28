import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:inventory_app/app/data/models/firebase_stock_model.dart';
import 'package:inventory_app/app/data/models/product_model.dart';
import 'package:inventory_app/app/modules/bottom_navbar/bottom_nav_page.dart';
import 'package:inventory_app/app/modules/user_login/login_page.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/firebase_constants.dart';
import '../data/models/user_details_model.dart';

class FirebaseController extends GetxController {
  String currentUserId = "";

  late Rx<User?> firebaseUser;
  var availableStockModel = <FirebaseStockModel>[].obs;
  User? user;
  RxBool netWorkStatus = true.obs;
  var deleteStatus = false.obs;

  //this variable 0 = No Internet, 1 = connected to WIFI ,2 = connected to Mobile Data.
  //Instance of Flutter Connectivity
  late UserData userData;

  int connectionType = 0;
  final Connectivity _connectivity = Connectivity();

  //Stream to keep listening to network change state
  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    _getConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
    firebaseUser = Rx<User?>(firebaseAuth.currentUser);

    firebaseUser.bindStream(firebaseAuth.userChanges());

    ever(firebaseUser, _setInitialScreen);

    if (netWorkStatus == false) {
      Constants.customToast("Please turn on your internet");
    } else {
      initializeFirebase();
    }
  }

  @override
  void onClose() {
    //stop listening to network state when app is closed
    _streamSubscription.cancel();
    super.onClose();
  }

  // a method to get which connection result, if you we connected to internet or no if yes then which network
  Future<void> _getConnectionType() async {
    ConnectivityResult? connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      print(e);
    }
    return _updateState(connectivityResult!);
  }

  // state update, of network, if you are connected to WIFI connectionType will get set to 1,
  // and update the state to the consumer of that variable.
  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType = 1;
        Constants.customToast("You are connected to wifi");
        netWorkStatus.value = true;
        break;
      case ConnectivityResult.mobile:
        connectionType = 2;
        netWorkStatus.value = true;
        Constants.customToast("You are connected to mobile data");
        break;
      case ConnectivityResult.none:
        connectionType = 0;
        netWorkStatus.value = false;
        Constants.customToast("Please connect to internet");
        break;
      default:
        netWorkStatus.value = false;
        Get.snackbar('Network Error', 'Failed to get Network Status');
        break;
    }
  }

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    user = FirebaseAuth.instance.currentUser;
    //getUserData(user!.uid);
    return firebaseApp;
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Constants.customToast("inside firecontroller login");
      Get.offAll(() => LoginPage(), transition: Transition.fadeIn);
    } else {
      Constants.customToast("insideelse else else firecontroller bottom");
      Get.offAll(() => BottomNavigationPage(), transition: Transition.fadeIn);
    }
  }

  void register(
      String username, String email, password, String selectedUserType) async {
    if (netWorkStatus == false) {
      Constants.customToast("Please turn on your internet");
    } else {
      try {
        Constants.customToast("inside registertry");
        CollectionReference reference =
            FirebaseFirestore.instance.collection("Users");
        await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          print(value.user?.uid.toString());
          UserData userData = UserData(
            id: value.user!.uid.toString(),
            userName: username,
            mailId: email,
            password: password,
            userType: selectedUserType,
            sms: false,
          );
          reference
              .doc(value.user?.uid.toString())
              .set(userData.toMap())
              .then((value) => Get.offAll(BottomNavigationPage()));
        }).catchError((onError) =>
                log("Inside registermethod on error catch $onError"));
      } catch (firebaseAuthException) {}
    }
  }

  void login(String email, String password) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {})
          .catchError((onError) =>
              Get.snackbar("Error while sign in ", onError.message));
    } catch (firebaseAuthException) {}
  }

  signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
      Get.offAll(LoginPage());
    } catch (e) {}
  }

  Future<QuerySnapshot<Object?>> getHotelDataFromFirestore() async {
    var response = await FirebaseFirestore.instance
        .collection("Hospitality")
        .get()
        .then((QuerySnapshot querySnapshot) {
      return querySnapshot;
    });

    return response;
  }

  Future<DocumentSnapshot<Object?>> getUserData() async {
    currentUserId = firebaseUser.value!.uid;
    var response = await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUserId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      return documentSnapshot;
    });
    return response;
  }

  addStockToFirebase(Products productdata, String quantity) {
    var date = DateTime.now().toString();
    var response = FirebaseFirestore.instance.collection("Stock").doc();
    var stockId = response.id;
    var finalData = FirebaseStockModel(
      productId: productdata.productId!,
      productName: productdata.productName!,
      productRate: productdata.productRate!,
      productImage: productdata.productImage!,
      categoryId: productdata.categoryId!,
      dateAdded: date,
      quantity: quantity,
      stockId: stockId,
    );

    response
        .set(finalData.toMap())
        .then((value) => Constants.customToast("data added successfully"));
  }

  Future<RxBool> removeStockFromDB(FirebaseStockModel datamodel) async {
    var response = await FirebaseFirestore.instance
        .collection("Stock")
        .doc(datamodel.stockId)
        .delete()
        .then((bool) {
      availableStockModel
          .removeWhere((value) => value.stockId == datamodel.stockId);
      deleteStatus.value = true;
    });
    return deleteStatus;
    update();
  }

  getStockDataFromFireDB() {
    var collection = FirebaseFirestore.instance.collection('Stock');
    collection.snapshots().listen((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        var stockSnapshot =
            FirebaseStockModel.fromDocumentSnapshot(documentSnapshot: doc);
        availableStockModel.add(stockSnapshot);
        update();
      }
    });
  }
}
