import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class CategorySquareWidget extends StatelessWidget {
  const CategorySquareWidget({Key? key,
    required this.itemassetDetail,
    required this.itemTitle}) : super(key: key);

  final String itemassetDetail;

  final String itemTitle;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 42.w,
        height: 15.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        margin: EdgeInsets.only(left:2.h,top: 2.h,right:1.h),
        child: Column(
          children: [
            Container(
              // width: 15.w,
              // height: 15.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22), color: Colors.white),
              margin: EdgeInsets.only(top: 3.w),
              child: ImageIcon(
                AssetImage(itemassetDetail),
                color: Colors.black,
                size: 55,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 3.w),
              child: Text(
                itemTitle,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
