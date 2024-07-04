import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/navigation_bar_controller.dart';
import 'package:my_store/core/constant/colors.dart';
import 'package:my_store/data/data_source/static.dart';
import 'package:my_store/data/model/bottom_bar_destination.dart';
import 'package:my_store/view/screens/cart.dart';
import 'package:my_store/view/screens/categories.dart';
import 'package:my_store/view/screens/home.dart';
import 'package:my_store/view/screens/profile.dart';
import 'package:my_store/view/screens/search.dart';

class MyNavigationBarWraper extends StatelessWidget {
  final NavigationBarController controller = Get.put(NavigationBarController());
  MyNavigationBarWraper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: const [
          Home(),
          Categories(),
          Search(),
          Cart(),
          Profile(),
        ],
      ),
      bottomNavigationBar: GetBuilder<NavigationBarController>(
        builder: (controller) => NavigationBar(
          destinations: bottomBarDestinations
              .map((destination) => _bottomBarItem(destination))
              .toList(),
        ),
      ),
    );
  }

  Widget _bottomBarItem(BottomBarDestination destination) {
    return MaterialButton(
      onPressed: () {
        controller.setIndex(destination.index);
      },
      color: controller.selectedIndex == destination.index
          ? MyColors.elsieLite
          : MyColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [destination.icon, Text(destination.label)],
      ),
    );
  }
}
