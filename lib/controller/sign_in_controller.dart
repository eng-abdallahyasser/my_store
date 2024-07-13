import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/firebase/auth.dart';

class SignInController extends GetxController {
  final Auth _auth = Auth();

  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  bool showPassword = false;

  void hidePassword() {
    showPassword = !showPassword;
    update();
  }

  Future<void> signIn() async {
    Get.dialog(const AlertDialog(
          title: Text('Signing In...'),
          content: SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          ),
        ));
    await _auth.signIn(emailController.text, pwController.text);
    Get.back();
    Get.offAllNamed(MyRoutes.navigationBarWraper);
  }
}
