import 'package:flutter/material.dart';
import 'package:my_store/data/data_source/static.dart';

import 'Product.dart';

class CartItem {
  Product? product;
  String? productId;
  int numOfItem;

  CartItem({
    this.product,
    this.productId,
    required this.numOfItem,
  });

  Map<String, dynamic> toJson() =>
      {"productId": product!.id, "numberOfItems": numOfItem};

  factory CartItem.fromJson(cart) {
    return CartItem(
      product: Product(imagesUrl: [], colors: []),
      productId: cart["productId"],
      numOfItem: cart["numberOfItems"],
    );
  }
}

// Demo data for our cart

List<CartItem> demoCarts = [
  CartItem(
      product: Product(
          imagesUrl: [
            "assets/images/ps4_console_white_1.png",
            "assets/images/ps4_console_white_2.png",
            "assets/images/ps4_console_white_3.png",
            "assets/images/ps4_console_white_4.png",
          ],
          colors: [
            const Color(0xFFF6625E),
            const Color(0xFF836DB8),
            const Color(0xFFDECB9C),
            Colors.white,
          ],
          title: "Wireless Controller for PS4™",
          price: 64.99,
          description: description,
          rating: 4.8,
          isFavourite: true,
          isPopular: true),
      numOfItem: 2),
  CartItem(
      product: Product(
          imagesUrl: [
            "assets/images/ps4_console_white_1.png",
            "assets/images/ps4_console_white_2.png",
            "assets/images/ps4_console_white_3.png",
            "assets/images/ps4_console_white_4.png",
          ],
          colors: [
            const Color(0xFFF6625E),
            const Color(0xFF836DB8),
            const Color(0xFFDECB9C),
            Colors.white,
          ],
          title: "Wireless Controller for PS4™",
          price: 64.99,
          description: description,
          rating: 4.8,
          isFavourite: true,
          isPopular: true),
      numOfItem: 1),
  CartItem(
      product: Product(
          imagesUrl: [
            "assets/images/ps4_console_white_1.png",
            "assets/images/ps4_console_white_2.png",
            "assets/images/ps4_console_white_3.png",
            "assets/images/ps4_console_white_4.png",
          ],
          colors: [
            const Color(0xFFF6625E),
            const Color(0xFF836DB8),
            const Color(0xFFDECB9C),
            Colors.white,
          ],
          title: "Wireless Controller for PS4™",
          price: 64.99,
          description: description,
          rating: 4.8,
          isFavourite: true,
          isPopular: true),
      numOfItem: 1),
];
