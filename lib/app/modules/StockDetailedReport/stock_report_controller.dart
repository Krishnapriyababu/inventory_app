

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_app/app/data/models/firebase_stock_model.dart';

import '../../data/models/stock_report_model.dart';


class StockReportController extends GetxController{

var productName = "".obs;
var productId = "".obs;
var graphdata = <StockReportModel>[].obs;




  void generateStockReport(RxList<FirebaseStockModel> stockDetailFromFirebase, FirebaseStockModel productdata) {
    productName.value = productdata.productName;
    productId.value = productdata.productId;
    for(var data in stockDetailFromFirebase){
      if(data.productId == productId.value){
        var ratedOn = DateTime.parse(data.dateAdded);
        final DateFormat formatter = DateFormat("MMM d");
        var ratedTime = formatter.format(ratedOn);
        graphdata.add(StockReportModel(ratedTime, int.parse(data.quantity)));
      }
    }

  }


}