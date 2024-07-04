import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constant/routes.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
        try {
          UserCredential credential =
              await _auth.createUserWithEmailAndPassword(
            email: emailController.text,
            password: pwController.text,
          );
          await credential.user?.updateDisplayName(nameController.text);
          Get.offAllNamed(MyRoutes.home);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
        } catch (e) {
          print(e.toString());
        }
      } else {
        print("Passwords don't match!");
      }
    } else {
      print("You have to input all fields");
    }
  }
}
