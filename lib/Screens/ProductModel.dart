import 'package:cloud_firestore/cloud_firestore.dart';
class ProductModel {
  String? documentId;
  late String item_name;
  late String item_rate;
  late String item_qty;
  late String item_image;

  ProductModel({
    required this.item_name,
    required this.item_rate,
    required this.item_qty,
    required this.item_image,

  });

  ProductModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    documentId = documentSnapshot.id;
    item_name = documentSnapshot["item_name"];
    item_rate = documentSnapshot["item_rate"];
    item_qty = documentSnapshot["item_qty"];
    item_image =documentSnapshot["item_image"];
  }
}
