import 'dart:developer';
import 'package:get/get.dart';
import 'package:inventory_app/app/data/models/category_model.dart';
import 'package:inventory_app/app/data/providers/dbHelper.dart';
import 'package:inventory_app/app/global_controller/firebasecontroller.dart';
import '../../data/providers/apiService.dart';


class DashboardController extends GetxController{
  List<Map<String, dynamic>> categoryList = [];
  final ApiServices _apiServices = ApiServices();
  late Response data ;
//  var localDbCategory = <String, dynamic>{}.obs;
  var localDbCategory = <CategoryModel>[];
  FirebaseController dashboardfirebaseController = Get.put(FirebaseController());
  @override
  void onInit() {
    dashboardfirebaseController.getStockDataFromFireDB();
    getCategoryDetails();
    getProductsList();
    getCategory();
  }
     getCategoryDetails() async {
     data = await _apiServices.getCategoryList();
     log("inside gettask ");
     if (data.statusCode == 200) {
       var category = await DbHelper.instance.getCategoryList();
       for (var element in category) {


         localDbCategory.add(CategoryModel(element["category_id"], element["category_name"], element["imageurl"]));
         log("dbDataaa ....  ${localDbCategory.length}");
         update();
       }
     }



     update();
  }

  Future<void> getProductsList() async {
    log("inside getProductsList ");
    await _apiServices.getProductsList();
  }
  Future<void>  getCategory() async {


  }
}