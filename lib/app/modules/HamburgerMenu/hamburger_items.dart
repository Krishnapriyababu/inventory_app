import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/modules/HamburgerMenu/hamburger_controller.dart';

import '../../global_controller/firebasecontroller.dart';


class NavItem extends StatelessWidget {
   NavItem({ Key? key, required this.title, required this.icon, required this.screenType,}) : super(key: key);
  final String title;
  final IconData icon;
  final String screenType;
HamburgerController hamburgerController = Get.put(HamburgerController());
   FirebaseController firebaseController = Get.put(FirebaseController());
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(this.icon),
      title: Text(this.title),
      onTap: () {
            hamburgerController.changeScreen(screenType);
            if(screenType == "Logout" ){
              firebaseController.signOut();
            }
      },
    );
  }
}