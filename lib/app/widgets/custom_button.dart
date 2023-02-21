import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String button_text;
  final Function()? onTap;
  const CustomButton({ super. key,required this.onTap,required this.button_text, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 5.h,
          width: 10.h,
        decoration: BoxDecoration(
            color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            button_text,
          style: const TextStyle(
              color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        ),
      ),
    );
  }
}
