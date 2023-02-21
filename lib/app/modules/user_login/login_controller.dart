import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inventory_app/app/modules/bottom_navbar/bottom_nav_page.dart';
import 'package:inventory_app/core/utils/constants.dart';

import '../../data/models/user_details_model.dart';
import '../../global_controller/firebasecontroller.dart';

class LoginController extends GetxController {
  late TextEditingController userEmailController;
  late TextEditingController passwordController;
  final FirebaseController _firebaseController = Get.put(FirebaseController());

  @override
  void onInit() {
    userEmailController = TextEditingController();
    passwordController = TextEditingController();
    // log("width...${AppLayout.getScreenWidth()}");
    // log("applayoutwidth...${AppLayout.getWidth(100)}");
    super.onInit();
  }

  void loginUser() {
    if(userEmailController.text == null || passwordController.text == null){
      Constants.customToast("Username or Password shouldn't be empty");
    }
    else{
      if (_firebaseController.netWorkStatus == false) {
        Constants.customToast("Please turn on your internet");
      } else {
        _firebaseController.login(
            userEmailController.text, passwordController.text);
      }

      log("dataaaa${userEmailController.text},${passwordController.text}");
    }

  }

  Future<User?> SignInWithGoogle() async {
    if (_firebaseController.netWorkStatus == false) {
      Constants.customToast("Please turn on your internet");
    } else {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        try {
          final UserCredential userCredential =
          await auth.signInWithCredential(credential);
          user = userCredential.user;
          if (user != null) {
            Constants.customToast('Sign in successful');
            UserData smsUserData = UserData(
                id: user.uid,
                userName: user.displayName!,
                mailId: user.email!,
                password: "",
                phoneNumber: "",
                sms: true);

            socialMediaSignIn(smsUserData);
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            Constants.customToast(
                'The account already exists with a different credential.');
          } else if (e.code == 'invalid-credential') {
            Constants.customToast('Error occurred while accessing credentials. Try again.');
          }
        } catch (e) {
          Constants.customToast("Error occurred using Google Sign-In. Try again.");
        }
      }
      return user;
    }
  }


  void socialMediaSignIn(UserData smsUserData) async {
    log("mediadata.... ${smsUserData.mailId}");
    CollectionReference reference =
    FirebaseFirestore.instance.collection("Users");
    reference
        .doc(smsUserData.id)
        .set(smsUserData.toMap())
        .then((value) => Get.offAll(const BottomNavigationPage()));
  }
}
