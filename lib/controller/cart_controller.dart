import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/data/data_source/repo.dart';
import 'package:my_store/data/model/address.dart';
import 'package:my_store/data/model/cart_item.dart';
import 'package:my_store/data/model/order.dart';
import 'package:my_store/view/screens/addresses/address.dart';

class CartController extends GetxController {
  List<CartItem> cartList = Repo.demoCarts;
  double total = 0.0;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  List<Address> addresses = [];
  Address selectedAddress = Address(
      userId: "userId",
      addressId: "addressId",
      name: "name",
      latitude: 0,
      longitude: 0,
      address: "address",
      phoneNumber: "phoneNumber");

  @override
  void onInit() async {
    calculateTotal();
    getAddresses();
    super.onInit();
  }

  void getAddresses() async {
    addresses = await Repo.getAddresses();
  }

  void calculateTotal() {
    total = 0.0;
    for (var item in cartList) {
      if (item.product != null) {
        total += item.product!.price * item.numOfItem;
      }
    }
    update();
  }

  void removeOneProduct(int index) {
    if (cartList[index].numOfItem > 1) {
      cartList[index].numOfItem -= 1;
    } else if (cartList[index].numOfItem == 1) {
      Get.dialog(AlertDialog(
        title: const Text("Are you sure?"),
        actions: [
          TextButton(
              onPressed: () {
                cartList.removeAt(index);
                Get.back();
                calculateTotal();
              },
              child: const Text("Yes, Remove It")),
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

  void placeOreder() async {
    // add progress indcator here
    Get.defaultDialog(
        title: "Saving Your Order",
        content: const Column(children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text("laoding")
        ]));
    List<Address> addresses = await Repo.getAddresses();
    if (addresses.isEmpty) {
      Get.back();
      Get.snackbar("Error", "Please add your address first",
          duration: const Duration(seconds: 10));
      Get.to(() => AddressScreen());
    } else {
      Get.back();
      Get.defaultDialog(
          title: "Choose Address",
          content: Column(children: [Text(addresses[0].address)]),
          onConfirm: () {
            Get.back();
            saveOrder();
          },
          textConfirm: "Confirm",
          onCancel: () {
            Get.back();
          });
    }
  }

  void selectAddress(addressTapped) {
    selectedAddress = addressTapped;
    update();
  }
}
