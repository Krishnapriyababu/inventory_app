import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String? id;
  String? userName;
  String? mailId;
  String? password;
  bool? sms;
  String? userType;

  UserData(
      {required this.id,
      required this.userName,
      required this.mailId,
      required this.password,
      required this.userType,
      required this.sms});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'mailId': mailId,
      'password': password,
      'userType':userType,
      'sms': sms
    };
  }

  UserData.fromDocumentSnapshot(
      {required DocumentSnapshot<Object?> documentSnapshot})
      : id = documentSnapshot["id"],
        userName = documentSnapshot["userName"],
        mailId = documentSnapshot["mailId"],
        password = documentSnapshot["password"],
        userType = documentSnapshot["userType"],
        sms = documentSnapshot["sms"];
}
