import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/modules/product_details/products_detailed_controller.dart';
import 'package:inventory_app/app/widgets/app_bar_widget_web.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/AppLayout.dart';
import '../../widgets/product_item_detail.dart';
import '../../widgets/product_item_detail_web.dart';

class ProductsDetailedScreenWeb extends StatelessWidget {
   ProductsDetailedScreenWeb({Key? key,required this.categoryName}) : super(key: key);
  final String categoryName;
  ProductsController _productsController =
  Get.put(ProductsController());
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBarWidgetWeb(
          height: AppLayout.getHeight(70),
          headline: categoryName,
        ),
        body: Container(
          width: screenSize.width,
          height: screenSize.height,

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
              height: screenSize.height -300,
              width:screenSize.width,

              child: GetBuilder<ProductsController>(
                builder: (context) {
                  // return  ListView.builder(
                  //     scrollDirection: Axis.vertical,
                  //     physics:
                  //     const BouncingScrollPhysics(),
                  //     itemCount:
                  //     context.localDbProducts.length,
                  //     itemBuilder: (context, index) {
                  //       return Row(children: [
                  //
                  //         ProductItemDetail(productdata: _productsController.localDbProducts[index],)
                  //       ]);
                  //     }
                  // );
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 1,

                      ),
                      itemCount: context.localDbProducts.length,
                      itemBuilder: (context,index){
                        return Row(children: [
                          ProductItemDetailWeb(productdata: _productsController.localDbProducts[index],)
                        ]
                        );
                      }
                  );
                },
              )
          ),
        ),
        backgroundColor: Colors.white);
  }
}
