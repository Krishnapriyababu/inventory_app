import 'dart:developer';
import 'package:get/get.dart';
import 'package:inventory_app/app/data/models/firebase_stock_model.dart';
import 'package:inventory_app/app/data/models/user_details_model.dart';
import 'package:inventory_app/core/utils/constants.dart';

import '../../global_controller/firebasecontroller.dart';

class StockDetailsController extends GetxController {
  var stockValue = "".obs;
  var userType = "".obs;
  var stockDetailFromFirebase = <FirebaseStockModel>[].obs;
  late UserData userData;
  FirebaseController stockfirebaseController = Get.put(FirebaseController());

  @override
  void onInit() {
    Constants.customToast("INside stock");

    getUserData();
    getStockDetailFromFirebase();

    super.onInit();
  }

  Future<void> getStockDetailFromFirebase() async {
     await stockfirebaseController.getStockDataFromFireDB();
    log("STOCKDATA... ${stockfirebaseController.availableStockModel.length} ");
    for(var i = 0; i < stockfirebaseController.availableStockModel.length; i++){
      stockDetailFromFirebase.add(stockfirebaseController.availableStockModel[i]);
      log("STOCKDATA...final ${stockDetailFromFirebase.length},,,,,${stockDetailFromFirebase.value[i].categoryId} ");
      update();
    }
  }
  removeStockDetails(FirebaseStockModel productdata) async {
  await stockfirebaseController
        .removeStockFromDB(productdata);
  if(stockfirebaseController.deleteStatus.value){
    stockDetailFromFirebase
        .removeWhere((value) => value.stockId == productdata.stockId);
    stockfirebaseController.deleteStatus.value = false;
    update();
  }{
    Constants.customToast("Unable to remove from db");
  }
  }

  Future<void> getUserData() async {
    var currentUserDetails = await stockfirebaseController.getUserData();
    if (currentUserDetails == null) {
      Constants.customToast("Could't get current user details");
    } else {
      userData =
          UserData.fromDocumentSnapshot(documentSnapshot: currentUserDetails);
      userType.value = userData.userType!;
      update();
      Constants.customToast(
          " current user details........   ${userData.userType}");
    }
    update();
  }



}
