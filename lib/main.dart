import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_app/app/modules/splash_page/splash_screen.dart';
import 'package:inventory_app/app/modules/user_registration/registerScreen.dart';
import 'package:sizer/sizer.dart';

import 'Screens/homePage.dart';
import 'app/modules/user_login/login_page.dart';

void main(){
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
      return   GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomePage(),
      );
    });




  }
}
