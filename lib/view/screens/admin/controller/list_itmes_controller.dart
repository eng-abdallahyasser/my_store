import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:my_store/data/model/Product.dart';

class ListItmesController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storege = FirebaseStorage.instance;

  Future<List<Product>> getAllProduct() async {
    final QuerySnapshot querySnapshot =
        await _firestore.collection('products').get();

    return querySnapshot.docs.map((doc) {
      return Product.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  Future<Uint8List?> getProductImageNumber(String productId, int number) async {
    final Uint8List? image =
        await _storege.ref().child("$productId/image$number.jpg").getData();
    try {
      return image;
    } catch (e) {
      print('Failed to get profile picture for uid $productId: $e');
      return null;
    }
  }
}
