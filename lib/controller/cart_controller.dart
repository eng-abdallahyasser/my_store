import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/data/data_source/repo.dart';
import 'package:my_store/data/model/cart_item.dart';
import 'package:my_store/data/model/order.dart';

class CartController extends GetxController {
  List<CartItem> cartList = Repo.demoCarts;
  double total = 0.0;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void onInit() async {
    calculateTotal();
    getUserDelivaryData();
    super.onInit();
  }

  void getUserDelivaryData() async {
    await Repo.getUserDelivaryData().then((delivaryData) {
      if (delivaryData != null) {
        phoneNumberController.text = delivaryData["phoneNumber"];
        addressController.text = delivaryData["address"];
      }
    });
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
    } else if (cartList[index].numOfItem == 0) {
      Get.dialog(AlertDialog(
        title: const Text("Are you sure?"),
        actions: [
          TextButton(
              onPressed: () {
                cartList.removeAt(index);
                update();
              },
              child: const Text("Yes")),
          TextButton(
              onPressed: () {
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

  void saveOrder() async {
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

    OrderForDelivary order = OrderForDelivary(
      carts: cartList,
      orderID: "",
      userAdress: addressController.text,
      userID: "id",
      userPhone: phoneNumberController.text,
    );

    //saving order ....
    await Repo.addOrder(order);

    cartList.clear();
    update(); // this update is not working i dont know why?

    // close it after finishing
    Get.back();
    Get.snackbar(
      "Success",
      "Your Order Saved successfully",
      snackPosition: SnackPosition.TOP,
    );
  }
}
