import 'dart:developer';
import 'package:get/get.dart';
import 'package:inventory_app/app/data/models/category_model.dart';
import 'package:inventory_app/app/data/providers/dbHelper.dart';
import '../../data/providers/apiService.dart';


class DashboardController extends GetxController{
  List<Map<String, dynamic>> categoryList = [];
  final ApiServices _apiServices = ApiServices();
  var data;
  @override
  void onInit() {
    getCategoryDetails();
    getProductsList();
    getTask();
  }
  Future<void> getCategoryDetails() async {
     data = await _apiServices.getCategoryList();
  }

  Future<void> getProductsList() async {
    log("inside getProductsList ");
    await _apiServices.getProductsList();
  }
  Future<void>  getTask() async {
    log("inside gettask ");
    data = await DbHelper.getItems();
   log("offlinedata${data}");
  }
}