import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../data/providers/apiService.dart';
import '../../data/providers/dbHelper.dart';

class ProductsController extends GetxController{
  var categoryidcategoryName = "".obs;
  final ApiServices _apiServices = ApiServices();
  var localDbProducts = <Products>[];
  late Response data ;
  late TextEditingController quantity;
  @override
  void onInit() {
quantity = TextEditingController();
  }
  getProductDetails(String categoryid) async {
    data = await _apiServices.getProductsList();
    log("productdata ....  ${data.body}");
  //  localDbProducts.clear();
   // var category = await DbHelper.instance.getProductListByCategory(categoryid);
    if (data.statusCode == 200) {
      for (var element in data.body["products"]) {
      //  log("productdata ....  ${element["product_name"]}");
        localDbProducts.add(Products(
            element["product_id"], element["product_name"],
            element["product_rate"], element["product_image"],
            element["category_id"]));
        // localDbProducts.add(item)
        //  log("productdata ....  ${localDbProducts[0].productName}");
        update();
      }
    }
    update();
  }
}