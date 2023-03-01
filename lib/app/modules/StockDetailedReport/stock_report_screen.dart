import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_app/app/data/models/firebase_stock_model.dart';
import 'package:inventory_app/app/modules/StockDetailedReport/stock_report_controller.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/AppLayout.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/line_chart.dart';


class StockReportScreen extends StatelessWidget {
   StockReportScreen({Key? key, required this.categoryName})
      : super(key: key);

//  final Products products;
  final FirebaseStockModel categoryName;
  final StockReportController _productsController =
  Get.put(StockReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          height: AppLayout.getHeight(120),
          headline: "${categoryName.productName}  Stock Report",
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
child: SingleChildScrollView(
  child: LineChart(
      title: _productsController.productName.value,
    report: _productsController.graphdata,),
),
        ),
        backgroundColor: Colors.white);
  }
}
