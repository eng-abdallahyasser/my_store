import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController pwController = TextEditingController();

  TextEditingController confirmPwController = TextEditingController();
  bool showPassword = false;
  bool showConfirmPassword = false;

  void hidePassword() {
    showPassword = !showPassword;
    update();
  }

  void hideConfirmPassword() {
    showConfirmPassword = !showConfirmPassword;
    update();
  }
}
