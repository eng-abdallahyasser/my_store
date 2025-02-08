import 'product.dart';

class CartItem {
  Product? product;
  String? productId;
  int numOfItem;
  String note="";

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
