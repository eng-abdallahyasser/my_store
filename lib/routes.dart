import 'package:flutter/material.dart';
import 'package:my_store/core/constant/routes.dart';
import 'package:my_store/view/screens/auth/signin.dart';
import 'package:my_store/view/screens/auth/signup.dart';
import 'package:my_store/view/screens/cart.dart';
import 'package:my_store/view/screens/home.dart';
import 'package:my_store/view/screens/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes = {

  MyRoutes.onboarding: (_) => Onboarding(),
  MyRoutes.signInScreen: (_) =>  SignInScreen(),
  MyRoutes.signUpScreen: (_) =>  SignUpScreen(),
  MyRoutes.home: (_) =>  const Home(),
  MyRoutes.cart: (_) =>  const Cart(),
};
