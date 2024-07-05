import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/navigation_bar_controller.dart';
import 'package:my_store/core/constant/colors.dart';
import 'package:my_store/data/data_source/static.dart';
import 'package:my_store/data/model/bottom_bar_destination.dart';
import 'package:my_store/view/screens/cart.dart';
import 'package:my_store/view/screens/categories.dart';
import 'package:my_store/view/screens/home.dart';
import 'package:my_store/view/screens/profile/profile.dart';
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
        builder: (controller) => BottomNavigationBar(
          onTap: controller.setIndex,
          currentIndex: controller.selectedIndex,
          showSelectedLabels: false,
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
      label: "Fav",
    );
  }
}
