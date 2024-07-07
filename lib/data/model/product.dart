import 'package:flutter/material.dart';

class Product {
  String id;
  int quantity;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price, oldPrice;
  final bool isFavourite, isPopular;
  final int favouritecount;

  Product({
    this.id = "",
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    this.favouritecount = 0,
    required this.title,
    required this.price,
    this.oldPrice = 0,
    required this.description,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "images": images,
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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? "",
      images: List<String>.from(json['images'] ?? []),
      colors: (json['colors'] as List<dynamic>)
          .map((colorString) => Color(int.parse(colorString, radix: 16)))
          .toList(),
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

  List<String> colorsStringList() {
    List<String> colorsStringList = [];
    for (var element in colors) {
      colorsStringList.add(element.value.toRadixString(16).padLeft(8, '0'));
    }
    return colorsStringList;
  }

  
}
