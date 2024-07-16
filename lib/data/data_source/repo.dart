import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_store/data/model/Product.dart';
import 'package:my_store/data/model/cart_item.dart';
import 'package:my_store/data/model/order.dart';
import 'package:my_store/firebase/auth.dart';
import 'package:my_store/firebase/firestore_services.dart';
import 'package:my_store/firebase/storage_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repo {
  static final FirestoreServices _firestore = FirestoreServices();
  static final StorageServices _storage = StorageServices();
  static final Auth _auth = Auth();
  static var prefs;
  static bool onboardingShown = false;
  Map<String, dynamic>? delivaryData = {};
  static List<Product> favouriteProducts = [];

  late List<Product> favouritProducts;
  static Future<List<Product>> demoProducts = getAllProduct();
  static List<CartItem> demoCarts = [];

  static Future<void> initializePrefs() async {
    prefs = await SharedPreferences.getInstance();
    onboardingShown = prefs.getBool('onboardingShown') ?? false;
  }

  static Future<List<Product>> getAllProduct() async {
    return await _firestore.getAllProduct();
  }

  static Future<List<OrderForDelivary>?> getAllOrders() async {
    try {
      return await _firestore.getAllOrders();
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // static Future<List> getAllCarts() async {
  //   final QuerySnapshot querySnapshot =
  //       await _firestore.collection('orders').get();
  //   return querySnapshot.docs.map((doc) {
  //     return Order.fromJson(doc.data() as Map<String, dynamic>);
  //   }).toList();
  // }

  static Future<Product> getProductById(String id) async {
    return _firestore.getProductById(id);
  }
  static Future<int> decrementFavoriteCountById(String id) async {
    return _firestore.decrementFavoriteCountById(id);
  }
  static Future<int> incrementFavoriteCountById(String id) async {
    return _firestore.incrementFavoriteCountById(id);
  }

  static Future<Uint8List?> getProductImageNumber(
      String productId, int number) async {
    return await _storage.getProductImageByNumber(productId, number);
  }

  static Future<Uint8List?> getProductImageUrl(String url) async {
    return await _storage.getProductImageUrl(url);
  }

  static Future<void> addItem(Product product, List<Uint8List> images) async {
    try {
      // Add the product to Firestore
      DocumentReference docRef = await _firestore.addProduct(product, images);
      // Upload each image to Firebase Storage
      _storage.uploadImages(images, docRef.id);
      print("Product Added with ID: ${docRef.id}");
    } catch (error) {
      print("Failed to add product: $error");
    }
  }

  static Future<void> addOrder(OrderForDelivary order) async {
    order.userID = _auth.getCurrentUser()!.uid;
    _firestore.addOrder(order);
    _firestore.saveUserData(
        _auth.getCurrentUser(), order.userPhone, order.userAdress);
  }

  static Future<Map<String, dynamic>?> getUserDelivaryData() async {
    return _firestore.getUserData(_auth.getCurrentUser()!.uid);
  }
}
