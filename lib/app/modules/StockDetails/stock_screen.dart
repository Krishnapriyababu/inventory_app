import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/app/modules/StockDetails/stock_screen_mobile.dart';
import 'package:inventory_app/app/modules/StockDetails/stock_screen_web.dart';


class StockScreen extends StatelessWidget {
  StockScreen({Key? key}) : super(key: key);
  var isWeb =kIsWeb;
  @override
  Widget build(BuildContext context) {
    if(isWeb) {
      return stockScreenWeb();
    } else{
      return stockScreenMobile();
    }
  }
}
