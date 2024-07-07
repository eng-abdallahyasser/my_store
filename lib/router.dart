import 'package:flutter/material.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/view/screens/auth/signin.dart';
import 'package:my_store/view/screens/auth/signup.dart';
import 'package:my_store/view/screens/cart/cart.dart';
import 'package:my_store/view/screens/home/categories.dart';
import 'package:my_store/view/screens/home/home.dart';
import 'package:my_store/view/screens/navigation%20wraper/my_navigation_bar.dart';
import 'package:my_store/view/screens/onboarding.dart';
import 'package:my_store/view/screens/profile/profile.dart';
import 'package:my_store/view/screens/search.dart';


Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.onboarding: (_) => Onboarding(),
  MyRoutes.signInScreen: (_) => SignInScreen(),
  MyRoutes.signUpScreen: (_) => SignUpScreen(),
  MyRoutes.home: (_) =>  const Home(),
  MyRoutes.cart: (_) =>   CartScreen(),
  MyRoutes.categories: (_) =>  const Categories(),
  MyRoutes.profile: (_) =>  const Profile(),
  MyRoutes.search: (_) =>  const Search(),
  MyRoutes.navigationBarWraper: (_) => MyNavigationBarWraper(),
};
