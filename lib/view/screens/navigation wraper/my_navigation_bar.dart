import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/navigation_bar_controller.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/data/data_source/static.dart';
import 'package:my_store/data/model/bottom_bar_destination.dart';
import 'package:my_store/view/screens/cart/cart.dart';
import 'package:my_store/view/screens/favourite/favourites_screen.dart';
import 'package:my_store/view/screens/home/home.dart';
import 'package:my_store/view/screens/profile/profile.dart';

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
          FavouritesScreen(),
          CartScreen(),
          Profile(),
        ],
      ),
      bottomNavigationBar: GetBuilder<NavigationBarController>(
        builder: (controller) => BottomNavigationBar(
          onTap: controller.setIndex,
          currentIndex: controller.selectedIndex,
          selectedItemColor: MyColors.elsie,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: bottomBarDestinations
              .map((destination) => _btmBarItem(destination))
              .toList(),
        ),
      ),
    );
  }

  BottomNavigationBarItem _btmBarItem(BottomBarDestination destination) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        destination.icon,
        colorFilter: const ColorFilter.mode(
          MyColors.gray,
          BlendMode.srcIn,
        ),
      ),
      activeIcon: SvgPicture.asset(
        destination.icon,
        colorFilter: const ColorFilter.mode(
          MyColors.elsie,
          BlendMode.srcIn,
        ),
      ),
      label: destination.label,
    );
  }
}
