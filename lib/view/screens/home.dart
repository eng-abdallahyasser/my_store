import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constant/routes.dart';
import 'package:my_store/view/screens/my_navigation_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      bottomNavigationBar: MyNavigationBar(),
      body: Column(
        children: [
          const Text("Home"),
          const SizedBox(
            height: 50,
          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed(MyRoutes.cart);
            },
            child: const Text("Go to Cart"),
          )
        ],
      ),
    );
  }
}