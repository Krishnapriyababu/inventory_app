import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/CategorySquareWidget.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
   DashboardScreen({Key? key}) : super(key: key);
  DashboardController dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        width: 100.w,
        height: 100.h,
        child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                  height: 8.h,
                  width: 100.w,
                  margin: EdgeInsets.all(2.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding:EdgeInsets.all(2.h),
                          child: Text("Category" ,style: TextStyle(color: Colors.grey,fontSize: 13.sp,fontWeight: FontWeight.w400),)),
                    ],
                  )
              ),
              Row(
                children: const [
                  CategorySquareWidget(itemassetDetail: 'assets/images/splash_image.png', itemTitle: ' \nLive practice',),
                  CategorySquareWidget(itemassetDetail: 'assets/images/splash_image.png', itemTitle: '   Pending\nassignments',)
                ],
              ),
              Row(
                children: const [
                  CategorySquareWidget(itemassetDetail: 'assets/images/splash_image.png', itemTitle: ' \nMy players',),
                  CategorySquareWidget(itemassetDetail: 'assets/images/splash_image.png',  itemTitle: ' \nCourses',)
                ],
              )


            ]),

      ),
    );
  }
}
