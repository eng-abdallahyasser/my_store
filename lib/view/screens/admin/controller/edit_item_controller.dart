// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_store/data/model/Product.dart';

class EditItemController extends GetxController {
  Product product = Product(
      title: "", imagesUrl: [], colors: [], price: 0.0, description: "");
  TextEditingController title = TextEditingController(text: "");
  TextEditingController price = TextEditingController();
  TextEditingController oldPrice = TextEditingController();
  TextEditingController rating = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController quantity = TextEditingController();
  List<Color> colorList = [];
  List<Uint8List> images = [];

  void onSaveClicked() {}
}
