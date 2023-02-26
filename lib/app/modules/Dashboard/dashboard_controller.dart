import 'dart:developer';
import 'package:get/get.dart';
import 'package:inventory_app/app/data/models/category_model.dart';
import 'package:inventory_app/app/data/providers/dbHelper.dart';
import '../../data/providers/apiService.dart';


class DashboardController extends GetxController{
  List<Map<String, dynamic>> categoryList = [];
  final ApiServices _apiServices = ApiServices();
  var data;
  var localDbCategory = <CategoryModel>[].obs;
  @override
  void onInit() {
    getCategoryDetails();
    getProductsList();
    getCategory();
  }
  Future<void> getCategoryDetails() async {
     data = await _apiServices.getCategoryList();
  }

  Future<void> getProductsList() async {
    log("inside getProductsList ");
    await _apiServices.getProductsList();
  }
  Future<void>  getCategory() async {
    log("inside gettask ");
    var category = await DbHelper.instance.getCategoryList();
    for (var element in category) {
      localDbCategory.add(CategoryModel(element["category_id"], element["category_name"], element["imageurl"]));
      // log("dbDataaa ....  ${localDbCategory.length}");

    }

  }
}