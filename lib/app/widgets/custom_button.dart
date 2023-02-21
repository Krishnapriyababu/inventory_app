import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String button_text;
  final Function()? onTap;
  const CustomButton({ super. key,required this.onTap,required this.button_text, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            button_text,
          style: TextStyle(
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
