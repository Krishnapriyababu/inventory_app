import 'package:flutter/material.dart';

import 'SqareImage.dart';

class viewProductsScreen extends StatelessWidget {

  const viewProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: ProductList()

    );
  }
}
