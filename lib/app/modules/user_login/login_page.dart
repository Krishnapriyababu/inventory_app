import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/modules/user_login/login_controller.dart';
import 'package:inventory_app/app/modules/user_registration/registerScreen.dart';
import 'package:inventory_app/app/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/user_type.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/password-input.dart';
import '../../widgets/square_tile.dart';
import '../../widgets/text-field-input.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

//sign  user in method
  LoginController loginController = Get.put(LoginController());
  final _loginformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child:

        Container(
          height: 100.h,
          width: 100.w,
          child: Center(
            child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _loginformKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 5.h),
                    //logo
                    const Icon(
                      Icons.lock,
                      size: 100,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Welcome back you\'ve been missed!',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
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
                                    groupValue: loginController
                                                .selectedUserType.value ==
                                            "Supervisor"
                                        ? UserType.Supervisor
                                        : UserType.nil,
                                    activeColor: Colors.green,
                                    onChanged: (UserType? value) {
                                      loginController.userTypeRadio(value);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<UserType>(
                                    title: const Text('Employee'),
                                    value: UserType.Employee,
                                    groupValue: loginController
                                                .selectedUserType.value ==
                                            "Employee"
                                        ? UserType.Employee
                                        : UserType.nil,
                                    activeColor: Colors.green,
                                    onChanged: (UserType? value) {
                                      loginController.userTypeRadio(value);
                                    },
                                  ),
                                ),
                              ]),
                        )),
                    TextInputField(
                      controller: loginController.userEmailController,
                      icon: Icons.mail_outline_rounded,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      controller: loginController.passwordController,
                      icon: Icons.lock_outline_rounded,
                      hint: 'Password',
                      inputAction: TextInputAction.done,
                    ),

                    Padding(
                      padding: EdgeInsets.only(right: 7.h, bottom: 1.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ]),
                    ),

                    CustomButton(
                      onTap: () {
                        // if (_loginformKey.currentState!.validate()) {
                        //   if (loginController.userType == UserType.nil) {
                        //     Constants.customToast('Please select type of user');
                        //   } else {
                            loginController.loginUser();
                        //   }
                        // }
                      },
                      button_text: 'SignIn',
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a Member ?",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
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
                    SizedBox(height: 1.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1.h),
                            child: Text(
                              "Or Continue with",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        //google imagebutton
                        InkWell(child: SquareTile(imagePath: 'assets/images/img.png'),onTap: () async {

                       
                            if (loginController.userType == UserType.nil) {
                              Constants.customToast('Please select type of user');
                            } else {
                              User? user =  await loginController.SignInWithGoogle();
                            }



                          // if (user != null) {
                          //   Get.offAll(BottomNa());
                          // }
                        },),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
