import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/data/data_source/repo.dart';
import 'package:my_store/data/model/cart_item.dart';
import 'package:my_store/data/model/order.dart';

class CartController extends GetxController {
  List<CartItem> cartList = Repo.demoCarts;
  double total = 0.0;

  @override
  void onInit() {
    calculateTotal();
    super.onInit();
  }

  void calculateTotal() {
    total = 0.0;
    for (var item in cartList) {
      total += item.product!.price * item.numOfItem;
    }
    update();
  }

  void removeOneProduct(int index) {
    if (cartList[index].numOfItem > 0) {
      cartList[index].numOfItem -= 1;
    }
    else if (cartList[index].numOfItem == 0) {
      Get.dialog(AlertDialog(
        title: const Text("Are you sure?"),
        actions: [
          TextButton(
              onPressed: () {
                cartList.removeAt(index);
              },
              child: const Text("Yes")),
          TextButton(onPressed: () {
            Get.back();
          },
          child: const Text("No"))
        ],
      ));
    }
    calculateTotal();
  }

  void addOneProduct(int index) {
    cartList[index].numOfItem += 1;
    calculateTotal();
  }

  void onOrderPress() async {
    // add progress indcator here
    Get.defaultDialog(
      title: "Saving Your Order",
      content: const Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text("Please wait..."),
        ],
      ),
    );

    //saving order ....
    await Repo.addOrder(OrderForDelivary(
      carts: cartList,
      orderID: "",
      userAdress: "adress",
      userID: "id",
      userPhone: "01023684509",
    ));

    cartList.clear();
    update();

    // close it after finishing
    Get.back();
    Get.snackbar(
      "Success",
      "Your Order Saved successfully",
      snackPosition: SnackPosition.TOP,
    );
  }
}
