import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/core/utils/constants.dart';
import '../../data/models/user_details_model.dart';
import '../../global_controller/firebasecontroller.dart';

class RegistrationController extends GetxController {
  final GlobalKey<FormState> regformkey = GlobalKey<FormState>();
  var userdata = <UserData>[].obs;
  late TextEditingController userName;
  late TextEditingController emailId;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late TextEditingController phoneNumber;
  late TextEditingController otpField;

  final FirebaseController _firebaseController = Get.put(FirebaseController());

  @override
  void onInit() {
    userName = TextEditingController();
    emailId = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    phoneNumber = TextEditingController();
    otpField = TextEditingController();


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


  void registerUser(BuildContext context) {
    if(_firebaseController.netWorkStatus == false){
      Constants.customToast("Please turn on your internet");
    }else{
      _firebaseController.register(
          userName.text, emailId.text, password.text, phoneNumber.text);
    }

  }
}
