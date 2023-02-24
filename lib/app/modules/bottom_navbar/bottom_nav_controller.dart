

import 'package:get/get.dart';

class BottomNavigationController extends GetxController{
  var tabIndex = 0.obs;

  void changetabIndex(int index){
    tabIndex.value = index;
  }
}
