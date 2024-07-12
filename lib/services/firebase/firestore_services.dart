import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_store/data/model/Product.dart';
import 'package:my_store/data/model/order.dart';

class FirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DocumentReference> addProduct(
      Product product, List<Uint8List> images) async {
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
    return docRef;
  }

  Future<void> addAdminToken(String token, String name) async {
    // Query to check if the token already exists
    QuerySnapshot existingTokens = await _firestore
        .collection("admins")
        .where("token", isEqualTo: token)
        .get();

    // If the token already exists, return early to prevent duplicate entry
    if (existingTokens.docs.isNotEmpty) {
      print("Token already exists");
      return;
    }
    Future<List<String>> getAdminTokens() async {
      // Query to get all documents in the "admins" collection
      QuerySnapshot querySnapshot = await _firestore.collection("admins").get();

      // Extract tokens from the documents
      List<String> tokens = querySnapshot.docs.map((doc) {
        return doc['token'] as String;
      }).toList();

      // Return the list of tokens
      return tokens;
    }

    // Add the new admin token to the collection
    DocumentReference docRef = await _firestore.collection("admins").add({
      "name": name,
      "token": token,
    });

    // Update the document with its own ID
    await docRef.update({"id": docRef.id});
  }

  Future<void> addOrder(OrderForDelivary order) async {
    try {
      // Add the order to Firestore
      DocumentReference docRef =
          await _firestore.collection("orders").add(order.toJson());
      await docRef.update({"orderID": docRef.id});
    } catch (error) {
      print("Failed to add order: $error");
    }
  }

  Future<Product> getProductById(String id) async {
    final DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection("products").doc(id).get();

    if (!doc.exists) {
      throw Exception("Product not found");
    }

    return Product.fromFirestore(doc);
  }

  Future<List<Product>> getAllProduct() async {
    final QuerySnapshot querySnapshot =
        await _firestore.collection('products').get();

    return querySnapshot.docs.map((doc) {
      return Product.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }
  Future<List<OrderForDelivary>> getAllOrders() async {
    final QuerySnapshot querySnapshot =
        await _firestore.collection("orders").get();

    return querySnapshot.docs.map((doc) {
      return OrderForDelivary.fromJson(doc.data() as Map<String, dynamic>);

    }).toList();
  }
}
