import 'package:flutter/material.dart';

import '../../core/utils/Styles.dart';

class ProductDataWidget extends StatelessWidget {
  const ProductDataWidget({Key? key, required this.data, required this.title}) : super(key: key);
  final String data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: heading1,
        ),
        Text(
          data,
          style: heading4,
        ),
      ],
    );
  }
}
