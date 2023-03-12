import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/modules/Dashboard/DashboardScreenMobile.dart';
import 'package:inventory_app/app/modules/Dashboard/DashboardScreenWeb.dart';
import 'dashboard_controller.dart';
import 'package:flutter/foundation.dart';
class DashboardScreen extends StatelessWidget {
  var isWeb =kIsWeb;
   DashboardScreen({Key? key}) : super(key: key);
  DashboardController dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    if(isWeb) {
      return DashboardScreenWeb();
    } else{
      return DashboardScreenPhone();
    }

  }
}
