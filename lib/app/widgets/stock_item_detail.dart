import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/modules/StockDetails/stock_controller.dart';
import 'package:inventory_app/app/widgets/product_data_widget.dart';
import 'package:inventory_app/app/widgets/quantity_enter_dialogue.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:sizer/sizer.dart';

import '../data/models/firebase_stock_model.dart';
import '../data/models/product_model.dart';
import '../global_controller/firebasecontroller.dart';
import '../modules/product_details/products_detailed_controller.dart';

class StockItemDetail extends StatelessWidget {
  StockItemDetail({Key? key, required this.productdata}) : super(key: key);

  final FirebaseStockModel productdata;
  StockDetailsController stockDetailsController =
      Get.put(StockDetailsController());
  final FirebaseController _firebaseController = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 20.h,
        width: 95.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.blueGrey),
        ),
        margin: EdgeInsets.only(left: 3.w, top: 1.h),
        child: Row(
          children: [

            Container(
              width: 13.h,
              height: 15.h,
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
              width: 60.w,
              height: 15.h,
              margin: EdgeInsets.only(left: 2.w, top: 1.h),
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
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductDataWidget(
                        data: (int.parse(productdata.quantity) *
                                int.parse(productdata.productRate))
                            .toString(),
                        title: 'Stock value : ',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.w,
                  ),
                  stockDetailsController.userType.value == "Employee"
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              InkWell(
                                onTap: () {
                                  // _firebaseController
                                  //     .removeStockFromDB(productdata);
                                  // Constants.customToast("tapped remove");
                                },
                                child: Container(
                                  width: 4.h,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black54),
                                  ),
                                  child: Image.asset(
                                    "assets/images/report.png",
                                    width: 3.h,
                                    height: 3.h,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                 stockDetailsController.removeStockDetails(productdata);
                                  Constants.customToast("tapped remove");
                                },
                                child: Container(
                                  width: 4.h,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black54),
                                  ),
                                  child: Image.asset(
                                    "assets/images/removedata.png",
                                    width: 3.h,
                                    height: 3.h,
                                  ),
                                ),
                              ),
                            ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
