import 'package:get/get.dart';
import 'package:my_store/data/model/cart_item.dart';

class CartController extends GetxController {
  List<CartItem> cartList = demoCarts;
  double total = 0.0;

  @override
  void onInit() {
    calculateTotal();
    super.onInit();
  }

  void calculateTotal() {
    total = 0.0;
    for (var item in cartList) {
      total += item.product.price * item.numOfItem;
    }
    update();
  }

  void removeOneProduct(int index) {
    if (cartList[index].numOfItem > 1) {
      cartList[index].numOfItem -= 1;
    }
    calculateTotal();
  }

  void addOneProduct(int index) {
    cartList[index].numOfItem += 1;
    calculateTotal();
  }
}
