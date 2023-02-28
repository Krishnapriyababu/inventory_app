import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/AppLayout.dart';

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
    return Container(
      height: preferredSize.height + 5,
      width: AppLayout.getScreenWidth(),
      decoration: BoxDecoration(
  color: Colors.greenAccent,
        border: Border.all(
            color: Colors.black54),
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

// Padding(
// padding: EdgeInsets.all(AppLayout.getHeight(25)),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// width: AppLayout.getWidth(70),
// height: AppLayout.getHeight(70),
// margin: const EdgeInsets.only(top: 10,left: 15,right: 15),
// //   margin: const EdgeInsets.only(top: 10,bottom: 700),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// image: const DecorationImage(
// fit: BoxFit.cover,
// image: AssetImage(
// "assets/images/letsgo.png"))),
// ),
// Container(
// width: AppLayout.getWidth(150),
// height: AppLayout.getHeight(50),
// margin: const EdgeInsets.only(top: 15,left: 10,right: 70),
// child:
// Text(
// details.placeName,
// style: const TextStyle(
// fontFamily: "BerkshireSwash",
// color: blackshade,
// fontSize: 30,
// fontWeight: FontWeight.bold),
// ),
//
// ),
//
// ],
// ),
// ),
