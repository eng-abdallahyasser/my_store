import 'package:get/get_state_manager/get_state_manager.dart';

class NavigationBarController extends GetxController {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  
  void setIndex(int index) {
    _selectedIndex = index;
  }

}
