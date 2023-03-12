import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/modules/product_details/products_detailed_controller.dart';
import 'package:inventory_app/app/modules/product_details/products_detailed_screen_mobile.dart';
import 'package:inventory_app/app/modules/product_details/products_detailed_screen_web.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/AppLayout.dart';
import '../../../core/utils/Styles.dart';
import '../../widgets/CathegoryItem.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/cathegory_divider.dart';
import '../../widgets/product_item_detail.dart';
import 'package:flutter/foundation.dart';
class ProductsDetailedScreen extends StatelessWidget {
  ProductsDetailedScreen({Key? key, required this.categoryName})
      : super(key: key);
  var isWeb =kIsWeb;
//  final Products products;
  final String categoryName;
  ProductsController _productsController =
      Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    if(isWeb) {
      return ProductsDetailedScreenWeb(categoryName: categoryName);
    } else{
      return ProductsDetailedScreenMobile(categoryName: categoryName);
    }
  }
}
