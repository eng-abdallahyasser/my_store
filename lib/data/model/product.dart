import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_store/data/data_source/repo.dart';
import 'package:my_store/data/model/variant.dart';

class Product {
  String id;
  int quantity;
  final String title, description, category;
  final List<String> imagesUrl;
  Uint8List? coverImageUnit8List;
  final List<Color> colors;
  final double rating, price, oldPrice;
  bool isInitialezed, isPopular;
  final int favouritecount;
  List<List<Variant>> options;
  List<String> optionsNames;

  Product({
    this.id = "",
    this.category="not foung",
    required this.imagesUrl,
    required this.colors,
    this.rating = 0.0,
    this.isInitialezed = false,
    this.isPopular = false,
    this.favouritecount = 0,
    this.title = "",
    this.price = 0.0,
    this.oldPrice = 0.0,
    this.description = "",
    this.quantity = 1,
    this.coverImageUnit8List,
    this.options = const [],
    this.optionsNames = const [],
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "images": imagesUrl,
        "colors": colorsStringList(),
        "rating": rating,
        "isPopular": isPopular,
        "favouritecount": favouritecount,
        "title": title,
        "price": price,
        "oldPrice": oldPrice,
        "description": description,
        "quantity": quantity,
        "options":options
          .map((innerList) =>
              innerList.map((variant) => variant.toJson()).toList())
          .toList(),
        "optionsNames":optionsNames
      };


  List<String> colorsStringList() {
    List<String> colorsStringList = [];
    for (var element in colors) {
      colorsStringList.add(element.value.toRadixString(16).padLeft(8, '0'));
    }
    return colorsStringList;
  }

  Future<Product> initializeCoverImage() async {
    coverImageUnit8List = await Repo.getProductImageUrl(imagesUrl[0]);
    isInitialezed=true;
    return this;
  }

  // Factory method to create a Product from Firestore data
  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return Product(
      id: json['id'] ?? "",
      imagesUrl: List<String>.from(json['images'] ?? []),
      colors: (json['colors'] as List<dynamic>)
          .map((colorString) => Color(int.parse(colorString, radix: 16)))
          .toList(),
      category: json['category'] ?? "not foung",
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      isInitialezed: false,
      isPopular: json['isPopular'] ?? false,
      favouritecount: json['favouritecount'] ?? 0,
      title: json['title'] ?? "",
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      oldPrice: (json['oldPrice'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] ?? "",
      quantity: json['quantity'] ?? 1,
      options: json['options'] == null
        ? <List<Variant>>[]
        : (json['options'] as List<dynamic>).map((innerList) {
            return (innerList as List<dynamic>).map((variantJson) {
              return Variant.fromJson(variantJson as Map<String, dynamic>);
            }).toList();
          }).toList(),
      optionsNames: List<String>.from(json['optionsNames'] ?? []),
    );
  }
}
