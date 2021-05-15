import 'package:crud_firebase/app/services/crud_example.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  CRUD crud = CRUD();
  TextEditingController nameController = TextEditingController();
  TextEditingController umurController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  String hasilan;

  List snapshot;
}
