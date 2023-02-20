import 'package:flutter/material.dart';
import 'package:inventory_app/Screens/registerScreen.dart';

import 'Screens/homePage.dart';
import 'Screens/login_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const HomePage(),
    );
  }
}
