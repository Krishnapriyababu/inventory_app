import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;

  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 15.w,
      padding: EdgeInsets.all(2.h),
      margin: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        image: DecorationImage(image: AssetImage(imagePath),)
      ),
      // child: Image.asset(
      //   ,
      //   height: 40,
      //   width: 40,
      // ),
    );
  }
}
