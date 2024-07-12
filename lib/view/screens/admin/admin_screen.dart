import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                        return Text(orders[index].orderID);
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
}
