import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../core/utils/constants.dart';
import '../../data/models/firebase_stock_model.dart';
import '../../data/models/user_details_model.dart';
import '../../global_controller/firebasecontroller.dart';




class StockDetailsController extends GetxController {
  var stockValue = "".obs;
  var userType = "".obs;
  var stockDetailFromFirebase = <FirebaseStockModel>[].obs;
  late UserData userData;
  FirebaseController stockfirebaseController = Get.put(FirebaseController());

  @override
  void onInit() {
    Constants.customToast("INside stock");

    getUserData();
    getStockDetailFromFirebase();

    super.onInit();
  }

  Future<void> getStockDetailFromFirebase() async {
    // List<FirebaseStockModel> data= await
    //  log("stockarraylength ..  ${data.length}");
  }

  Future<void> getUserData() async {
    var currentUserDetails = await stockfirebaseController.getUserData();
    if (currentUserDetails == null) {
      Constants.customToast("Could't get current user details");
    } else {
      userData =
          UserData.fromDocumentSnapshot(documentSnapshot: currentUserDetails);
      log("STOCKDATA... ${stockfirebaseController.availableStockModel.length} ");
      for(var i = 0; i < stockfirebaseController.availableStockModel.length; i++){
        stockDetailFromFirebase.add(stockfirebaseController.availableStockModel[i]);
        log("STOCKDATA...final ${stockDetailFromFirebase.length},,,,,${stockDetailFromFirebase.value[i].categoryId} ");
        update();
      }
      update();
      Constants.customToast(
          " current user details........   ${userData.userType}");
    }
    update();
  }



}