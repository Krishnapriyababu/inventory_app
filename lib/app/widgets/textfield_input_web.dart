import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/Styles.dart';
import '../modules/user_registration/registeration_controller.dart';

class TextInputFieldWeb extends StatelessWidget {
  const TextInputFieldWeb({
    Key? key,
    required this.icon,
    required this.hint,
    required this.controller,
    this.inputType,
    this.inputAction,
  }) : super(key: key);
  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    RegistrationController registrationController = Get.put(RegistrationController());
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.symmetric(vertical:1.h),
      child: Container(
        height:8.h,
        width: 20.w,
        decoration: BoxDecoration(
          // color: Colors.blue[200]!.withOpacity(0.3),
          borderRadius: BorderRadius.circular(6),
        ),

        child: Center(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: hint,
              labelStyle:   TextStyle(color: Colors.blueGrey,fontSize: 4.sp,fontWeight: FontWeight.w500),
              prefixIcon: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: .5.h),
                child: Icon(
                  icon,
                  size: 3.sp,
                  color:  Colors.blueGrey,
                ),
              ),
              hintStyle: headingWeb1,
            ),
            style: headingWeb1,
            keyboardType: inputType,
            textInputAction: inputAction,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator:
                (value){
              if(hint == "UserName"){
                if (value!.isEmpty) {
                  return 'Please enter First name';
                }


              }
              else if(hint == "Email"){
                if (value!.isEmpty) {
                  return 'Please enter EmailId';
                } else if (registrationController.isEmailValid(value)) {
                  return null;
                }
                return "Enter a valid mail Id";
              }
              else if (hint=="Phone Number"){
                if (value!.isEmpty) {
                  return 'Please enter a Password';
                } else if (value.length < 10 || value.length > 10) {
                  return ("please enter a valid phone number");
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
