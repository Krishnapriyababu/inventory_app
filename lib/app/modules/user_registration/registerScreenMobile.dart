import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/modules/user_registration/registerScreen.dart';
import 'package:inventory_app/app/modules/user_registration/registeration_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/user_type.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/password-input.dart';
import '../../widgets/text-field-input.dart';

class RegisterPageMobile extends StatelessWidget {
   RegisterPageMobile({Key? key}) : super(key: key);
  final _regformKey = GlobalKey<FormState>();
  RegistrationController registrationController =
  Get.put(RegistrationController());

  //sign  user in method
  void signUserIn() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: _regformKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //alignment: Alignment.,
                      padding: EdgeInsets.only(
                          left: 2.h, top: 3.h, right: 2.h, bottom: 2.h),
                      child: const Text(
                        "Create A New Account",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 25),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    //logo
                    const Icon(
                      Icons.lock,
                      size: 100,
                    ),
                    SizedBox(height: 3.h),
                    TextInputField(
                      controller: registrationController.userName,
                      icon: FontAwesomeIcons.user,
                      hint: 'UserName',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.envelope,
                      controller: registrationController.emailId,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      controller: registrationController.password,
                      hint: 'Password',
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      controller: registrationController.confirmPassword,
                      hint: 'Confirm Password',
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(height: 1.h),
                    //radio button
                    Obx(() => Container(
                      margin: EdgeInsets.all(3.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RadioListTile<UserType>(
                                title: const Text('Supervisor'),
                                value: UserType.Supervisor,
                                groupValue: registrationController
                                    .selectedUserType.value ==
                                    "Supervisor"
                                    ? UserType.Supervisor
                                    : UserType.nil,
                                activeColor: Colors.green,
                                onChanged: (UserType? value) {
                                  registrationController
                                      .userTypeRadio(value);
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<UserType>(
                                title: const Text('Employee'),
                                value: UserType.Employee,
                                groupValue: registrationController
                                    .selectedUserType.value ==
                                    "Employee"
                                    ? UserType.Employee
                                    : UserType.nil,
                                activeColor: Colors.green,
                                onChanged: (UserType? value) {
                                  registrationController
                                      .userTypeRadio(value);
                                },
                              ),
                            ),
                          ]),
                    )),
                    SizedBox(height: 1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          onTap: () {
                            if (_regformKey.currentState!.validate()) {
                              if (registrationController.userType ==
                                  UserType.nil) {
                                log("inside second if");
                                Constants.customToast(
                                    'Please select type of user');
                              } else {
                                registrationController.registerUser();
                              }
                            }
                          },
                          button_text: 'SignUp',
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a Member ?",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 1.w),
                        InkWell(
                          onTap: () {
                            Get.to(RegisterPage());
                          },
                          child: const Text(
                            "Register Now",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
