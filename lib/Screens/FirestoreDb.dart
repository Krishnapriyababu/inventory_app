


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory_app/Screens/ProductModel.dart';

import '../core/utils/firebase_constants.dart';

class FirestoreDb{

  static Stream<List<ProductModel>> productStream() {
    return firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('todos')
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProductModel> products = [];
      for (var plist in query.docs) {
        final Model =
            ProductModel.fromDocumentSnapshot(documentSnapshot:plist );
        products.add(Model);
      }
      return products;
    });
  }
}

