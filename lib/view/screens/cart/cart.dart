import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/cart_controller.dart';
import 'package:my_store/data/model/cart_item.dart';
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
              "${demoCarts.length} items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: demoCarts.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(demoCarts[index].product!.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {},
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child: GetBuilder<CartController>(builder: (controller) {
                return CartCard(
                  cart: controller.cartList[index],
                  add: () {
                    controller.addOneProduct(index);
                    print('$index');
                  },
                  remove: () {
                    controller.removeOneProduct(index);
                  },
                );
              }),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CheckoutCard(controller: controller,),
    );
  }
}
