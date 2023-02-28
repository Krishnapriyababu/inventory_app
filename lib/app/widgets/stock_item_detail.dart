

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/modules/StockDetails/stock_controller.dart';
import 'package:inventory_app/app/widgets/product_data_widget.dart';
import 'package:inventory_app/app/widgets/quantity_enter_dialogue.dart';
import 'package:sizer/sizer.dart';

import '../data/models/firebase_stock_model.dart';
import '../data/models/product_model.dart';
import '../global_controller/firebasecontroller.dart';
import '../modules/product_details/products_detailed_controller.dart';

class StockItemDetail extends StatelessWidget {
   StockItemDetail({Key? key, required this.productdata}) : super(key: key);

  final FirebaseStockModel productdata;
   StockDetailsController stockDetailsController = Get.put(StockDetailsController());
  final FirebaseController _firebaseController = Get.put(FirebaseController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        height: 15.h,
        width: 95.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.blueGrey),
        ),
        margin: EdgeInsets.all(1.h),
        child: Row(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //       borderRadius:
            //       const BorderRadius.all(Radius.circular(15)),
            //       border: Border.all(
            //           color: Colors.white),
            //   ),
            //   padding: EdgeInsets.only(left: 1.h),
            //   child: Image.network( productdata.productImage!,
            //     width: 15.h,
            //     height: 15.h,
            //    )
            // ),

            Container(
              width: 10.h,
              height: 10.h,
              margin: EdgeInsets.only(
                left: 1.w,
              ),
              //   margin: const EdgeInsets.only(top: 10,bottom: 700),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productdata.productImage!))),
            ),
            SizedBox(height: 2.h),

            Container(
              width: 65.w,
              height: 12.h,
              // color: Colors.blue,
              margin: EdgeInsets.only(left: 2.w, top: 2.w),
              child: Column(
                children: [
                  ProductDataWidget(
                    data: productdata.productName!,
                    title: '',
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductDataWidget(
                        data: productdata.productId!,
                        title: 'Pdt Id : ',
                      ),
                      ProductDataWidget(
                        data: productdata.categoryId!,
                        title: 'Ctg Id : ',
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductDataWidget(
                        data: productdata.quantity!,
                        title: 'Quantity : ',
                      ),
                      ProductDataWidget(
                        data: productdata.productRate!,
                        title: 'Pdt price : ',
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductDataWidget(
                        data: stockDetailsController.stockValue.value,
                        title: 'Stock value : ',
                      ),

                      stockDetailsController.userType.value == "Employee" ?Container():
                      InkWell(
                        onTap: () {
                          _firebaseController.removeStockFromDB(productdata);

                        },
                        child: Container(
                          width: 4.h,
                          height: 4.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black54),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/removedata.png"))),
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
