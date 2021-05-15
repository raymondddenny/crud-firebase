import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CRUD {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUser({String name, @required String umur}) {
    CollectionReference users = firestore.collection("users");

    return users
        .add({'name': name, 'umur': umur, 'uid': users.id})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Stream<void> getUsers() {
    CollectionReference users = firestore.collection("users");

    return users.snapshots();
  }

  Future<QuerySnapshot> getUsersById(String id) {
    CollectionReference users = firestore.collection("users");

    return users.where('uid', isEqualTo: id).get();
  }
}
