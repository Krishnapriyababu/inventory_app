import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStockModel {
  String? productId;
  String? productName;
  String? productRate;
  String? productImage;
  String? categoryId;
  String? dateAdded;
  String? quantity;
  String? stockId;

  FirebaseStockModel(
      {this.productId,
      required this.productName,
      required this.productRate,
      required this.productImage,
      required this.categoryId,
      required this.dateAdded,
      required this.quantity,
      required this.stockId});

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productRate': productRate,
      'productImage': productImage,
      'categoryId': categoryId,
      'dateAdded': dateAdded,
      'quantity': quantity,
      'stockId':stockId
    };
  }

  FirebaseStockModel.fromDocumentSnapshot(
      {required DocumentSnapshot<Object?> documentSnapshot})
      : productName = documentSnapshot["productName"],
        productRate = documentSnapshot["productRate"],
        productImage = documentSnapshot["productImage"],
        categoryId = documentSnapshot["categoryId"],
        dateAdded = documentSnapshot["dateAdded"],
        quantity = documentSnapshot["quantity"],
        stockId = documentSnapshot["stockId"];
}
