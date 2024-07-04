import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_store/controller/navigation_bar_controller.dart';

class MyNavigationBar extends StatelessWidget {
  final NavigationBarController controller = Get.put(NavigationBarController());
  MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationBarController>(builder: (controller) {
      return NavigationBar(
        selectedIndex: controller.selectedIndex,
        destinations: [
          _bottomBarItem(
            0,
            Icon(Icons.home_outlined),
            'Home',
          ),
          _bottomBarItem(
            1,
            Icon(Icons.home_outlined),
            'Home',
          ),
          _bottomBarItem(
            2,
            Icon(Icons.home_outlined),
            'Home',
          ),
          _bottomBarItem(
            3,
            Icon(Icons.home_outlined),
            'Home',
          ),
        ],
      );
    });
  }

  Widget _bottomBarItem(index, icon, label) {
    return InkWell(
      onTap: () {
        controller.setIndex(index);
      },
      child: NavigationDestination(
        icon: icon,
        label: label,
      ),
    );
  }
}
