import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inventory_app/Screens/ProductModel.dart';

import '../../data/models/product_model.dart';
import '../../data/providers/dbHelper.dart';

class ProductsController extends GetxController{
  var categoryidcategoryName = "".obs;
  var localDbProducts = <Products>[].obs;
  late TextEditingController quantity;
  @override
  void onInit() {
    quantity = TextEditingController();
  }
  getProductDetails(String categoryid) async {
    localDbProducts.clear();
    var category = await DbHelper.instance.getProductListByCategory(categoryid);
    for (var element in category) {
      log("productdata ....  ${element["product_name"]}");
      localDbProducts.add(Products(element["product_id"],element["product_name"],element["product_rate"],element["product_image"],element["category_id"]));
      // localDbProducts.add(item);

    }
  }
}