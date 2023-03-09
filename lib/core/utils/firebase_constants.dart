import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

final Future<FirebaseApp> firebaseInitialization = kIsWeb
    ? Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBcXqlY3k6GG3inGabNloMNkFtDxj-3qo8",
        appId: "1:521388347020:web:95d83021258b8f4a3475a9",
        messagingSenderId: "521388347020",
        projectId: "inventory-management-766f3",
        authDomain: "inventory-management-766f3.firebaseapp.com",
        storageBucket: "inventory-management-766f3.appspot.com",
        measurementId: "G-T4LVX8Y112"))
    : Firebase.initializeApp();
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;