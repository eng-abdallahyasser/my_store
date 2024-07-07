import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_store/data/model/Product.dart';

class FirestoreServices{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(Product product)async{
    await _firestore.collection('products').add(product.toJson());
  }

}