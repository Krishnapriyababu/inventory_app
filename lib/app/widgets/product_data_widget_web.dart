import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/Styles.dart';

class ProductDataWidgetWeb extends StatelessWidget {
  const ProductDataWidgetWeb({Key? key, required this.data, required this.title}) : super(key: key);
  final String data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style:TextStyle(fontSize: 4.sp, color: Colors.black54),
        ),
        Text(
          data,
          style: TextStyle(fontSize: 4.sp, color: Colors.black54),
        ),
      ],
    );
  }
}
