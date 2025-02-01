import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_store/data/data_source/repo.dart';

class Product {
  String id;
  int quantity;
  final String title, description, category;
  final List<String> imagesUrl;
  Uint8List? coverImageUnit8List;
  final List<Color> colors;
  final double rating, price, oldPrice;
  final bool isFavourite, isPopular;
  final int favouritecount;

  Product({
    this.id = "",
    this.category="not foung",
    required this.imagesUrl,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    this.favouritecount = 0,
    this.title = "",
    this.price = 0.0,
    this.oldPrice = 0.0,
    this.description = "",
    this.quantity = 1,
    this.coverImageUnit8List,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "images": imagesUrl,
        "colors": colorsStringList(),
        "rating": rating,
        "isFavourite": isFavourite,
        "isPopular": isPopular,
        "favouritecount": favouritecount,
        "title": title,
        "price": price,
        "oldPrice": oldPrice,
        "description": description,
        "quantity": quantity,
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
      isFavourite: json['isFavourite'] ?? false,
      isPopular: json['isPopular'] ?? false,
      favouritecount: json['favouritecount'] ?? 0,
      title: json['title'] ?? "",
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      oldPrice: (json['oldPrice'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] ?? "",
      quantity: json['quantity'] ?? 1,
    );
  }
}
