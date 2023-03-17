import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/modules/user_login/login_page.dart';
import 'package:inventory_app/app/modules/user_login/login_page_Web.dart';

import '../Dashboard/dashboard_screen.dart';
import '../StockDetails/stock_screen.dart';
import 'hamburger_controller.dart';
import 'hamburger_items.dart';

class HamburgerMenu extends StatelessWidget {
   HamburgerMenu({Key? key}) : super(key: key);
  HamburgerController hamburgerController=Get.put(HamburgerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx Sidebar'),
      ),
      key: hamburgerController.scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            NavItem(
              title: "Dashboard",
              icon: Icons.dashboard_outlined,
              screenType: "Dashboard",
            ),
            NavItem(
              title: "Stock ",
              icon: Icons.inventory_2_outlined,
              screenType: "Stock",
            ),
            NavItem(
              title: "Logout",
              icon: Icons.logout,
              screenType: "Logout",
            ),
          ],
        ),
      ),
      body: Obx(()=>
      hamburgerController.screentype.isEmpty? DashboardScreen():
          hamburgerController.screentype.value == "Dashboard" ? DashboardScreen():
          hamburgerController.screentype.value == "Stock" ? StockScreen():
          hamburgerController.screentype.value == "Logout" ? LoginPage(): DashboardScreen()
      ),

    );
  }
}
