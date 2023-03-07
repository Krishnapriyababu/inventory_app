import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/app/global_controller/firebasecontroller.dart';
import 'package:inventory_app/app/modules/splash_page/splash_screen.dart';
import 'package:inventory_app/app/modules/user_registration/registerScreen.dart';
import 'package:sizer/sizer.dart';

import 'app/modules/user_login/login_page.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Sizer(
        builder: (context, orientation, deviceType)
    {
      return      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen(),
      );
    });




  }
}
