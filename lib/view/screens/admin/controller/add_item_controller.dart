import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_store/data/data_source/static.dart';
import 'package:my_store/data/model/Product.dart';
import 'package:my_store/data/data_source/repo.dart';

class AddItemController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController oldPrice = TextEditingController();
  TextEditingController rating = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController quantity = TextEditingController();
  List<Color> colorList = [];
  List<Uint8List> images = [];

  void colorPick(Color color) {
    if (colorList.contains(color)) {
      colorList.remove(color);
    } else {
      colorList.add(color);
    }
    update();
  }

  void onSaveClicked() async {
    if (title.text.isNotEmpty &&
        price.text.isNotEmpty &&
        quantity.text.isNotEmpty) {
      Get.defaultDialog(
        title: "Saving Product",
        content: const Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text("Please wait..."),
          ],
        ),
        barrierDismissible: false,
      );
      try {
        await Repo.addItem(
            Product(
                imagesUrl: [],
                colors: colorList,
                title: title.text,
                price: double.parse(price.text),
                description: description,
                isPopular: true,
                quantity: int.parse(quantity.text)),
            images);

        // Close the dialog after the operation is completed
        Get.back();
        Get.back();
        // Show a success dialog or toast
        Get.snackbar(
          "Success",
          "Product added successfully",
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (error) {
        // Close the dialog in case of an error
        Get.back();

        // Show an error dialog or toast
        Get.snackbar(
          "Error",
          "Failed to add product: $error",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        "Error",
        "Please fill in all required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void addImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    images.add(await pickedFile.readAsBytes());

    update();
  }
}
