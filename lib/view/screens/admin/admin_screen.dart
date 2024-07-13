import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/data/data_source/repo.dart';
import 'package:my_store/data/model/order.dart';
import 'package:my_store/view/screens/admin/add_item_screen.dart';
import 'package:my_store/view/screens/admin/list_items_screen.dart';
import 'package:my_store/view/screens/profile/components/profile_menu.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileMenu(
              text: "Add New Item",
              icon: "assets/icons/Plus Icon.svg",
              press: () => {Get.to(() => AddItemScreen())},
            ),
            ProfileMenu(
              text: "Edit or Delete Existed Item",
              icon: "assets/icons/Plus Icon.svg",
              press: () => {Get.to(() => ListItemsScreen())},
            ),
            const SizedBox(height: 25),
            FutureBuilder(
              future: Repo.getAllOrders(),
              builder: (builder, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  var orders = snapshot.data as List<OrderForDelivary>;
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return _orderTile(context, orders[index]);
                      });
                }
                return const Text(" error ..");
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _orderTile(BuildContext context, OrderForDelivary order) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(order.userAdress),
          Text(order.userPhone),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.carts.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                    future: Repo.getProductById(order.carts[index].productId!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return const Text(" error ..");
                      }
                      return Row(
                        children: [
                          SizedBox(
                            width: 88,
                            child: AspectRatio(
                              aspectRatio: 0.88,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F6F9),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: FutureBuilder(
                                      future: Repo.getProductImageUrl(snapshot.data!.imagesUrl[0]),
                                      builder: (context, nestedsnapshot) {
                                        if (nestedsnapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        if (nestedsnapshot.hasError ||
                                            nestedsnapshot.data == null) {
                                          return Image.asset(
                                              "assete/images/product_placeholder.jpg",
                                              fit: BoxFit.cover);
                                        }
                                        return Image.memory(
                                            nestedsnapshot.data!,
                                            fit: BoxFit.cover);
                                      }),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.title,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                                maxLines: 2,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text(
                                    "جـ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: MyColors.elsie),
                                  ),
                                  Text(
                                    " ${snapshot.data!.price}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: MyColors.elsie),
                                  ),
                                  Text("  x${order.carts[index].numOfItem}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    });
              }),
        ],
      ),
    );
  }
}
