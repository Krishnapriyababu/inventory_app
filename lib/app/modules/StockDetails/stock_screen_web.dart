import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:inventory_app/app/global_controller/firebasecontroller.dart';
import 'package:inventory_app/app/modules/StockDetails/stock_controller.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/AppLayout.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/stock_item_detail.dart';
import '../../widgets/stock_item_detail_web.dart';

class stockScreenWeb extends StatelessWidget {
   stockScreenWeb({Key? key}) : super(key: key);
  StockDetailsController stockDetailsController = Get.put(
      StockDetailsController());
  FirebaseController firebaseController = Get.put(FirebaseController());
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBarWidget(
          height: AppLayout.getHeight(120),
          headline: "WareHouse",

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
              height: screenSize.width,
              width: screenSize.height,
              child:
              GetBuilder<StockDetailsController>(
                builder: (context) {
                  return Obx(() =>
                  stockDetailsController.stockDetailFromFirebase.isEmpty ?
                  Container(
                    width:screenSize.width -100,
                    height: screenSize.height -100,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                  ) :
                  GridView.builder(
                      // scrollDirection: Axis.vertical,
                      // physics: const BouncingScrollPhysics(),
                      // itemCount: stockDetailsController.stockDetailFromFirebase.value.length,
                      // itemBuilder: (context, index) {
                      //   return Row(children: [
                      //     StockItemDetail(productdata: stockDetailsController.stockDetailFromFirebase.value[index])
                      //   ]
                      //   );
                      // }
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1,

                      ),
                      itemCount:stockDetailsController.stockDetailFromFirebase.value.length,
                      itemBuilder: (context,index){
                        return Row(children: [
                          StockItemDetailWeb(productdata: stockDetailsController.stockDetailFromFirebase.value[index])
                        ]
                        );
                      }
                  )
                  );
                },
              )


          ),
        ),


        backgroundColor: Colors.white);
  }
}
