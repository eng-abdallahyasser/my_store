import 'dart:developer';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_store/data/model/address.dart';
import 'package:my_store/data/model/product.dart';
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
  static List<String> favouriteProducts = [];
  static String userId = _auth.getCurrentUser()!.uid;

  static Future<List<Product>> demoProducts = getAllProduct();
  static List<CartItem> demoCarts = [];

  static Future<void> init() async {
    favouriteProducts = await getFavorites();
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
      log(e.toString());
    }
    return null;
  }

  static Future<List<String>> getFavorites() async {
    return _firestore.getFavorites(userId);
  }

  static Future<Product> getProductById(String id) async {
    return _firestore.getProductById(id);
  }

  static Future<List<Product>> getProductsByCategory(String category) async {
    return _firestore.getProductsByCategory(category);
  }

  static Future<List<Product>> getPopularProducts() async {
    return _firestore.getPopularProducts();
  }

  static Future<int> removeFromFavorites(String id) async {
    return _firestore.decrementFavoriteCountById(id, userId);
  }

  static Future<void> addToFavorites(String productId) async {
    await _firestore.incrementFavoriteCountById(productId, userId);
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
    } catch (error) {
      log("Failed to add product: $error");
    }
  }

  static Future<void> addOrder(OrderForDelivary order) async {
    order.userID = userId;
    await _firestore.addOrder(order);
  }

  static Future<void> addAddress(Address address) async {
    address.userId = userId;
    await _firestore.addAddress(address);
  }

  static Future<List<Address>> getAddresses() {
    return _firestore.getAddresses(userId);
  }

  static saveAdminToken() {}
}
