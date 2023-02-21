import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:inventory_app/core/utils/user_type.dart';
import '../../data/models/user_details_model.dart';
import '../../global_controller/firebasecontroller.dart';

class RegistrationController extends GetxController {
  final GlobalKey<FormState> regformkey = GlobalKey<FormState>();
  var userdata = <UserData>[].obs;
  late TextEditingController userName;
  late TextEditingController emailId;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late TextEditingController otpField;
  late UserType userType;
  RxString selectedUserType = "".obs;

  final FirebaseController _firebaseController = Get.put(FirebaseController());

  @override
  void onInit() {
    userName = TextEditingController();
    emailId = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    otpField = TextEditingController();
    userType = UserType.nil;


    super.onInit();
  }

//validating the form before creating user
  bool checkLogin() {
    final isValid = regformkey.currentState!.validate();
    if (!isValid) {
      return isValid;
    }
    regformkey.currentState!.save();
    return isValid;
  }

  void userTypeRadio(value){
    userType = value;

    if (UserType.Supervisor == userType) {
      selectedUserType.value = "Supervisor";
    }
    else if((UserType.Employee == userType)){
      selectedUserType.value = "Employee";
    }
    else{
      selectedUserType.value = "";
    }
    log("usertype .....  ${selectedUserType.value}");
  }

//password validation
  bool isPasswordValid(String password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,20}$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(password);
  }

  //email validation
  bool isEmailValid(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }




  void registerUser() {
    if(_firebaseController.netWorkStatus == false){
      Constants.customToast("Please turn on your internet");
    }else{
      Constants.customToast("registercalled");
      _firebaseController.register(
          userName.text, emailId.text, password.text,selectedUserType.value);
    }

  }
}
