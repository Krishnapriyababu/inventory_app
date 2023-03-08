import 'dart:developer';

import 'package:get/get.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';
import 'dbHelper.dart';

class ApiServices extends GetConnect {
  final _getConnect = GetConnect();

  Future<Response> getCategoryList() async {
    const url = "https://demo4087667.mockable.io/category_list";

    Response response = await _getConnect.get(url);
    if (response.statusCode == 200) {
      final result = response.body;
      // log("dbdataaaacategory   $result");
    //  await DbHelper.instance.deleteItem("Category");
      for (var data in result) {
        var datafetched = CategoryModel.fromJson(data);
        log("dbdataaaa   ${datafetched.categoryName}");
     //   await DbHelper.instance.insertCategory(datafetched);
      }

    } else {
      throw Exception("Failed to get data");
    }
    return response;
  }

  Future<Response> getProductsList() async {
    const url = "https://demo4087667.mockable.io/productlist";
    //   log("inside getProductsList api ");
    Response response = await _getConnect.get(url);
    //  log("inside getProductsList afterapicall");
    if (response.statusCode == 200) {
      //   log("inside getProductsList staus got");
      final result = response.body;
   //   await DbHelper.instance.deleteItem("Products");
      for (var data in result["products"]) {
        var datafetched = Products.fromJson(data);
       // log("dbdataaaagetProductsList   ${datafetched.productName}");

     //   await DbHelper.instance.insertProducts(datafetched);
      }
    } else {
      throw Exception("Failed to get data");
    }
    return response;
  }
}
