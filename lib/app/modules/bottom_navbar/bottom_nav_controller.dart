

import 'package:get/get.dart';
import 'package:inventory_app/app/global_controller/firebasecontroller.dart';

class BottomNavigationController extends GetxController{
  var tabIndex = 0.obs;
FirebaseController firebaseController = Get.put(FirebaseController());
@override
  void onInit() {
  firebaseController.getUserData();
    super.onInit();
  }
  void changetabIndex(int index){
    tabIndex.value = index;
  }
}
