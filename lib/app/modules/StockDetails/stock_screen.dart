import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:inventory_app/app/modules/StockDetails/stock_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_layout.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/stock_item_detail.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StockDetailsController stockDetailsController = Get.put(StockDetailsController());
    return  Scaffold(
        appBar: AppBarWidget(
          height: AppLayout.getHeight(120),
          headline: "WareHouse",
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
              child:
              GetBuilder<StockDetailsController>(
                builder: (context) {
                  return
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemCount: context.stockDetailFromFirebase.length,
                        itemBuilder: (context, index) {
                          return Row(
                              children: [
                            StockItemDetail(productdata: stockDetailsController.stockDetailFromFirebase[index])
                            // Container(
                            //   width: 25.w,
                            //   height: 1.h,
                            //   decoration: const BoxDecoration(
                            //     color: Colors.red,
                            //   ),
                            // )
                          ]);
                        })
                  ;
                },
              )



          ),
        ),


        backgroundColor: Colors.white);
  }
}
