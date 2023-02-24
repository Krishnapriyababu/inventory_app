import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../Dashboard/dashboard_screen.dart';
import '../ReportScreen/report_screen.dart';
import '../StockDetails/stock_screen.dart';
import 'bottom_nav_controller.dart';

class BottomNavigationPage extends StatelessWidget {
   BottomNavigationPage({Key? key}) : super(key: key);
  final  BottomNavigationController bottomNavController = Get.put(BottomNavigationController());
  static final List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    StockScreen(),
    ReportScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Center(
          child: _widgetOptions[bottomNavController.tabIndex.toInt()]),

      bottomNavigationBar: Container(
        height: 8.h,
        width: 100.w,

        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: .5, color: context.theme.colorScheme.surface),

        ),
        child: BottomNavigationBar(
          unselectedItemColor: context.theme.colorScheme.secondary,
          selectedItemColor:context.theme.colorScheme.surface,
          onTap: bottomNavController.changetabIndex,
          currentIndex: bottomNavController.tabIndex.toInt(),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
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
                icon: Icon(Icons.insert_chart_outlined_rounded,color: Colors.green),
                activeIcon: Icon(Icons.insert_chart_rounded,color: Colors.green), label: "Report"),
          ],
        ),
      ),
      backgroundColor: context.theme.colorScheme.background,

    ));
  }
}
