import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/Screens/ProductListController.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/app_layout.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String districtName;
  final String headline;

  const AppBarWidget({
    Key? key,
    required this.height,
    required this.headline,
    required this.districtName,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  get color => null;

  @override
  Widget build(BuildContext context) {
    ProductListController detailedViewController =
        Get.put(ProductListController());
    return Container(
      height: preferredSize.height + 5,
      width: AppLayout.getScreenWidth(),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.greenAccent,
             Colors.white,
            ],
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
            tileMode: TileMode.decal),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: AppLayout.getWidth(55),
              height: AppLayout.getHeight(55),
              margin: EdgeInsets.only(
                  top: 5.h,),
              //   margin: const EdgeInsets.only(top: 10,bottom: 700),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/img.png"))),
            ),
            Row(
              children: [
                Container(
                  width:25.h,
                  height: AppLayout.getHeight(100),
                  margin: EdgeInsets.only(
                      top: 6.h,right: 5.h
                  ),
                  child: Text(
                    headline,
                    style: const TextStyle(
                        fontFamily: "BerkshireSwash",
                        color: Colors.black54,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
