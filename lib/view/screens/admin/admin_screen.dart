import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Column(children: [
        ProfileMenu(
              text: "Add New Item",
              icon: "assets/icons/Plus Icon.svg",
              press: () => {
                Get.to(()=> AddItemScreen())
              },
            ),
            ProfileMenu(
              text: "Edit or Delete Existed Item",
              icon: "assets/icons/Plus Icon.svg",
              press: () => {
                Get.to(()=>ListItemsScreen())
              },
            ),
            ProfileMenu(
              text: "remove Item",
              icon: "assets/icons/Plus Icon.svg",
              press: () => {},
            ),
      ],),
    );
  }
}