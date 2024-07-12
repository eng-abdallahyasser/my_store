import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/cart_controller.dart';
import 'package:my_store/view/screens/cart/check_out_card.dart';
import 'package:my_store/view/screens/cart/cart_card.dart';

class CartScreen extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Your CartScreen",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${controller.cartList.length} items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: controller.cartList.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.cartList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GetBuilder<CartController>(builder: (controller) {
                      return CartCard(
                        cart: controller.cartList[index],
                        add: () {
                          controller.addOneProduct(index);
                          
                        },
                        remove: () {
                          controller.removeOneProduct(index);
                        },
                      );
                    }),
                  ),
                )
              : const Center(
                  child: Text(
                  "No items in cart",
                  style: TextStyle(fontSize: 20),
                ))),
      bottomNavigationBar: CheckoutCard(
        controller: controller,
      ),
    );
  }
}
