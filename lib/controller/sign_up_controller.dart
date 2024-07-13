import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/firebase/auth.dart';

class SignUpController extends GetxController {
  final Auth _auth = Auth();

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

  Future<void> signUp() async {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        pwController.text.isNotEmpty &&
        confirmPwController.text.isNotEmpty) {
      if (pwController.text == confirmPwController.text) {
        Get.dialog(const AlertDialog(
          title: Text('Signing Up...'),
          content: SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          ),
        ));
        await _auth.signUp(
            emailController.text, pwController.text, nameController.text);
      } else {
        print("Passwords don't match!");
      }
    } else {
      print("You have to input all fields");
    }
    Get.back();
    Get.offAllNamed(MyRoutes.navigationBarWraper);
  }
}
