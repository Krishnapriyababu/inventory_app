import 'package:flutter/material.dart';


class NavHeader extends StatelessWidget {
  const NavHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height : 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0))
            ),

          ),
          Text("Welcome")
        ],
      ),
    );
  }
}
