import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/modules/StockDetails/stock_controller.dart';
import 'package:inventory_app/app/widgets/product_data_widget.dart';
import 'package:inventory_app/app/widgets/product_data_widget_web.dart';
import 'package:inventory_app/app/widgets/quantity_enter_dialogue.dart';
import 'package:inventory_app/core/utils/constants.dart';
import 'package:sizer/sizer.dart';

import '../data/models/firebase_stock_model.dart';
import '../data/models/product_model.dart';
import '../global_controller/firebasecontroller.dart';
import '../modules/StockDetailedReport/stock_report_controller.dart';
import '../modules/StockDetailedReport/stock_report_screen.dart';
import '../modules/product_details/products_detailed_controller.dart';

class StockItemDetailWeb extends StatelessWidget {
  StockItemDetailWeb({Key? key, required this.productdata}) : super(key: key);

  final FirebaseStockModel productdata;
  StockDetailsController stockDetailsController =
  Get.put(StockDetailsController());
  final FirebaseController _firebaseController = Get.put(FirebaseController());
  final StockReportController stockReportController = Get.put(StockReportController());
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        height: 230,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.blueGrey),
        ),
        margin: EdgeInsets.only(left: 5, top: 10),
        child: Row(
          children: [

            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(
                left: 5,
              ),
              //   margin: const EdgeInsets.only(top: 10,bottom: 700),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productdata.productImage!))),
            ),
            SizedBox(height:20),

            Container(
              width: 230,
              height:130,
              margin: EdgeInsets.only(left: 20, top:20,right: 20),
              child: Column(
                children: [
                  ProductDataWidgetWeb(
                    data: productdata.productName!,
                    title: '',
                  ),
                  SizedBox(
                    height:20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductDataWidgetWeb(
                        data: productdata.productId!,
                        title: 'Pdt Id : ',
                      ),
                      //   ProductDataWidget(
                      //     data: productdata.categoryId!,
                      //     title: 'Ctg Id : ',
                      //   ),
                      ProductDataWidgetWeb(
                        data: (int.parse(productdata.quantity) *
                            int.parse(productdata.productRate))
                            .toString(),
                        title: 'total : ',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductDataWidgetWeb(
                        data: productdata.quantity!,
                        title: 'Quantity : ',
                      ),
                      ProductDataWidgetWeb(
                        data: productdata.productRate!,
                        title: ' price : ',
                      ),
                    ],
                  ),
                  SizedBox(
                    height:10,
                  ),

                  stockDetailsController.userType.value == "Employee"
                      ? Container()
                      : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            stockReportController.generateStockReport(stockDetailsController.stockDetailFromFirebase,productdata);
                            Get.to(StockReportScreen(categoryName: productdata,));
                          },
                          child: Container(
                            width: 3.h,
                            height: 3.h,
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
                            width: 50,
                            height: 20,
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
