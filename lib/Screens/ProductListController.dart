
import 'package:get/get.dart';
import 'package:inventory_app/Screens/FirestoreDb.dart';
import 'package:inventory_app/Screens/ProductModel.dart';

class ProductListController extends GetxController{
  Rx<List<ProductModel>> productList = Rx<List<ProductModel>>([]);
  List<ProductModel> get prodcts => productList.value;
@override
  void onReady() {
  productList.bindStream(FirestoreDb.productStream());

  }
}

