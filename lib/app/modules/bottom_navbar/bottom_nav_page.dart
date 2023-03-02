import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/modules/SearchScreen/search_screen.dart';
import 'package:sizer/sizer.dart';

import '../Dashboard/dashboard_screen.dart';

import '../StockDetails/stock_screen.dart';
import 'bottom_nav_controller.dart';

class BottomNavigationPage extends StatelessWidget {
   BottomNavigationPage({Key? key,}) : super(key: key);
  // final String userType ;
  final  BottomNavigationController bottomNavController = Get.put(BottomNavigationController());
  static final List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    StockScreen(),
     SearchScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Center(
          child: _widgetOptions[bottomNavController.tabIndex.toInt()]),

      bottomNavigationBar: Container(
        height: 8.h,
        width: 100.w,

        margin:  EdgeInsets.only(
            left:1.w, top: 0.0, right: 1.w, bottom:2.w),
        padding: const EdgeInsets.only(left: 15,right: 15),

        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: .5, color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(20),
        ),
        child: BottomNavigationBar(
          unselectedItemColor: context.theme.colorScheme.secondary,
          selectedItemColor:context.theme.colorScheme.surface,
          onTap: bottomNavController.changetabIndex,
          currentIndex: bottomNavController.tabIndex.toInt(),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedLabelStyle: const TextStyle(color: Colors.grey),
          unselectedLabelStyle: const TextStyle(color: Colors.green),
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.white,
          elevation: 0.0,

          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined,color: Colors.green,),
                activeIcon: Icon(Icons.dashboard_rounded,color: Colors.green),
                label: "Dashboard"),
            BottomNavigationBarItem(
                icon: Icon(Icons.inventory_2_outlined,color: Colors.green),
                activeIcon: Icon(Icons.inventory_2_rounded,color: Colors.green), label: "Stock"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search,color: Colors.green),
                activeIcon: Icon(Icons.saved_search_sharp,color: Colors.green), label: "search"),
          ],
        ),
      ),
      backgroundColor: Colors.white,

    ));
  }
}
