import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/modules/user_registration/registerScreenMobile.dart';
import 'package:inventory_app/app/modules/user_registration/registerScreenWeb.dart';
import 'package:inventory_app/app/modules/user_registration/registeration_controller.dart';
import '../../../core/utils/user_type.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final _regformKey = GlobalKey<FormState>();
  RegistrationController registrationController =
      Get.put(RegistrationController());

  //sign  user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    var isWeb =kIsWeb;
    UserType? userTypeRadio = UserType.nil;
    if(isWeb) {
      return RegisterPageWeb();
    } else{
      return RegisterPageMobile();
    }
  }
}
