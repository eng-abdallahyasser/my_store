import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constant/routes.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  bool showPassword = false;

  void hidePassword() {
    showPassword = !showPassword;
    update();
  }

  Future<void> signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: pwController.text);
      Get.offAllNamed(MyRoutes.home);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
