import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/modules/product_details/products_detailed_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/AppLayout.dart';
import '../../../core/utils/Styles.dart';
import '../../widgets/CathegoryItem.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/cathegory_divider.dart';
import '../../widgets/product_item_detail.dart';

class ProductsDetailedScreen extends StatelessWidget {
  ProductsDetailedScreen({Key? key, required this.categoryName})
      : super(key: key);

//  final Products products;
  final String categoryName;
  ProductsController _productsController =
      Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          height: AppLayout.getHeight(120),
          headline: categoryName,
        ),
        body: Container(
            width: 100.w,
            height: 100.h,

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.greenAccent,
                  ],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.mirror),
            ),
        child: Container(
            height: 100.h,
            width: 100.w,
        
            child: GetBuilder<ProductsController>(
              builder: (context) {
                return  ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics:
                    const BouncingScrollPhysics(),
                    itemCount:
                    context.localDbProducts.length,
                    itemBuilder: (context, index) {
                      return Row(children: [

                        ProductItemDetail(productdata: _productsController.localDbProducts[index],)
                      ]);
                    }
                    );

              },
            )
        ),
        ),
        backgroundColor: Colors.white);
  }
}
