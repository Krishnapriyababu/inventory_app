import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/app/data/models/product_model.dart';
import 'package:inventory_app/app/widgets/product_data_widget_web.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/AppLayout.dart';
import '../../core/utils/Styles.dart';
import '../global_controller/firebasecontroller.dart';
import '../modules/product_details/products_detailed_controller.dart';
import 'quantity_enter_dialogue.dart';

class ProductItemDetailWeb extends StatelessWidget {
  ProductItemDetailWeb({
    Key? key,
    required this.productdata,
  }) : super(key: key);
  final Products productdata;
  ProductsController productsController = Get.put(ProductsController());
  FirebaseController _firebaseController = Get.put(FirebaseController());
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {

      },
      child: Container(
        height: 200,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.blueGrey),
        ),
        margin: EdgeInsets.all(2),
        child: Row(
          children: [
            Container(
              width:70,
              height:70,
              margin: EdgeInsets.only(
                  left:2
              ),
              //   margin: const EdgeInsets.only(top: 10,bottom: 700),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productdata.productImage!))),
            ),
            SizedBox(height: 3),

            Container(
              width:200,
              height: 130,
              // color: Colors.blue,
              margin: EdgeInsets.only(left: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProductDataWidgetWeb(
                    data: productdata.productName!,
                    title: '',
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductDataWidgetWeb(
                        data: productdata.productId!,
                        title: 'Pdt Id : ',
                      ),
                      ProductDataWidgetWeb(
                        data: productdata.categoryId!,
                        title: 'Ctg Id : ',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductDataWidgetWeb(
                        data: productdata.productRate!,
                        title: 'Pdt price : ',
                      ),
                      InkWell(
                        onTap: () {
                          Get.defaultDialog(
                              backgroundColor:
                              context.theme.colorScheme.background,
                              titleStyle: TextStyle(
                                  color: context.theme.colorScheme.background),
                              middleTextStyle: TextStyle(
                                  color: context.theme.colorScheme.background),
                              content: QuantityDetails(
                                productdata: productdata,
                              ),
                              textConfirm: "Add Stock",
                              confirmTextColor: Colors.black,
                              buttonColor: context.theme.colorScheme.primary,
                              onConfirm: () {
                                if(productsController.quantity != ""){
                                  _firebaseController.addStockToFirebase(productdata,productsController.quantity.text);
                                  Get.back();

                                  // productsController.quantity.text = "";
                                }
                              });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black54),
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.redAccent,
                                    BlendMode.saturation,
                                  ),
                                  image: AssetImage(
                                      "assets/images/addtostock.png"))),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
