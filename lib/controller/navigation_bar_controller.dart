import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/data/data_source/static.dart';

class NavigationBarController extends GetxController {
  int selectedIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  void setIndex(int index) {
    if (selectedIndex != index) {
      selectedIndex = index;
      Get.offAndToNamed(bottomBarDestinations[index].route);
      update();
    }
  }
}
