import 'package:my_store/data/model/cart_item.dart';

class OrderForDelivary {
  List<CartItem> carts;
  int number;
  String orderID;
  String userID;
  String userAdress;
  String userPhone;
  String dateTime;

  OrderForDelivary({
    required this.carts,
    required this.orderID,
    required this.userID,
    required this.userAdress,
    required this.userPhone,
    this.number = 0,
    this.dateTime = "not found",
  });

  Map<String, dynamic> toJson() {
    return {
      'carts': carts.map((cart) => cart.toJson()).toList(),
      'orderID': orderID,
      'userID': userID,
      'userAdress': userAdress,
      'userPhone': userPhone,
      'date': DateTime.now().toIso8601String(),
      'number': number,
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
      number: json['number'],
      dateTime: json['date'],
    );
  }
}
