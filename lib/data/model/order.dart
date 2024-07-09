import 'package:my_store/data/model/cart_item.dart';

class OrderForDelivary {
  List<CartItem> carts;
  String orderID;
  String userID;
  String userAdress;
  String userPhone;

  OrderForDelivary({
    required this.carts,
    required this.orderID,
    required this.userID,
    required this.userAdress,
    required this.userPhone,
  });

  Map<String, dynamic> toJson() {
    return {
      'carts': carts.map((cart) => cart.toJson()).toList(),
      'orderID': orderID,
      'userID': userID,
      'userAdress': userAdress,
      'userPhone': userPhone,
    };
  }

  factory OrderForDelivary.fromJson(Map<String, dynamic> json) {
    return OrderForDelivary(
      carts: (json['carts'] as List)
          .map((cart) => CartItem.fromJson(cart))
          .toList(),
      orderID: json['orderID'],
      userID: json['userID'],
      userAdress: json['userAdress'],
      userPhone: json['userPhone'],
    );
  }
}
