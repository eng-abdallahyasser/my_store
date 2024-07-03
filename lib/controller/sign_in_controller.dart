import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  bool showPassword = false;

  void hidePassword(){
    showPassword = !showPassword;
    update();
  }

}