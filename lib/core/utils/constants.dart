
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


abstract class Constants{
  static customToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      // message
      toastLength: Toast.LENGTH_SHORT,
      // length
      gravity: ToastGravity.BOTTOM,
      // location
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blueGrey.shade300, // duration
    );
  }

}