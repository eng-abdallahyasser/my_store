
import 'package:flutter/material.dart';
import 'package:my_store/view/screens/auth/signin.dart';
import 'package:my_store/view/screens/auth/signup.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _SigninOrSignupState();
}

class _SigninOrSignupState extends State<Auth> {
  bool signInPage = true;

  void togglePages() {
    setState(() {
      signInPage = !signInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signInPage) {
      return SigninScreen(
        togglePages: togglePages,
      );
    } else {
      return SignupScreen(
        togglePages: togglePages,
      );
    }
  }
}