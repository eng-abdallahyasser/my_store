import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:my_store/data/model/Product.dart';

class Repo {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  late List<Product> allProducts;
  late List<Product> favouritProducts;

  void fitchData() async {
    allProducts = await getAllProduct();
  }

  static Future<List<Product>> getAllProduct() async {
    final QuerySnapshot querySnapshot =
        await _firestore.collection('products').get();

    return querySnapshot.docs.map((doc) {
      return Product.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  static Future<Uint8List?> getProductImageNumber(
      String productId, int number) async {
    final Uint8List? image =
        await _storage.ref().child("$productId/image$number.jpg").getData();
    try {
      return image;
    } catch (e) {
      print('Failed to get profile picture for uid $productId: $e');
      return null;
    }
  }

  static Future<void> addItem(Product product, List<Uint8List> images) async {
    try {
      // Add the product to Firestore
      DocumentReference docRef =
          await _firestore.collection("products").add(product.toJson());

      // Generate URLs for images
      List<String> urls = [];
      for (int index = 0; index < images.length; index++) {
        urls.add("${docRef.id}/image$index.jpg");
      }

      // Update the Firestore document with the document ID and image URLs
      await docRef.update({"id": docRef.id, "images": urls});

      // Upload each image to Firebase Storage
      for (int index = 0; index < images.length; index++) {
        final imageRef = _storage.ref().child("${docRef.id}/image$index.jpg");
        await imageRef.putData(images[index]);
      }
      print("Product Added with ID: ${docRef.id}");
    } catch (error) {
      print("Failed to add product: $error");
    }
  }
}
