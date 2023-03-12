import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/AppLayout.dart';

class AppBarWidgetWeb extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String headline;

  const AppBarWidgetWeb({
    Key? key,
    required this.height,
    required this.headline,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  get color => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height + 10,
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
            InkWell(
              // onTap: (){
              //   if(headline == "Inventory Manager"){
              //
              //   }
              // },
              child: Container(
                width: AppLayout.getWidth(55),
                height: AppLayout.getHeight(30),
                margin: EdgeInsets.only(
                    top: 2,left: 350),
                //   margin: const EdgeInsets.only(top: 10,bottom: 700),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/splash_image.png")

                    )

                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width:150,
                  height: AppLayout.getHeight(30),
                  margin: EdgeInsets.only(
                      top: 6,right: 550
                  ),
                  child: Text(
                    headline,
                    style: const TextStyle(
                        fontFamily: "BerkshireSwash",
                        color: Colors.black54,
                        fontSize: 15,
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

