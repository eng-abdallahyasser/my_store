import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:my_store/core/constant/routes.dart';
import 'package:my_store/view/screens/auth/signin.dart';
import 'package:my_store/view/screens/auth/signup.dart';
import 'package:my_store/view/screens/cart.dart';
import 'package:my_store/view/screens/categories.dart';
import 'package:my_store/view/screens/home.dart';
import 'package:my_store/view/screens/my_navigation_bar.dart';
import 'package:my_store/view/screens/onboarding.dart';
import 'package:my_store/view/screens/profile/profile.dart';
import 'package:my_store/view/screens/search.dart';

final List<GetPage> getPages = [
  GetPage(
    name: MyRoutes.onboarding,
    page: () => Onboarding(),
    transition: Transition.noTransition, // Disable animation
  ),
  GetPage(
    name: MyRoutes.signInScreen,
    page: () => SignInScreen(),
    transition: Transition.noTransition, // Disable animation
  ),
  GetPage(
    name: MyRoutes.signUpScreen,
    page: () => SignUpScreen(),
    transition: Transition.noTransition, // Disable animation
  ),
  GetPage(
    name: MyRoutes.home,
    page: () =>  const Home(),
    transition: Transition.noTransition, // Disable animation
  ),
  GetPage(
    name: MyRoutes.categories,
    page: () =>  const Categories(),
    transition: Transition.noTransition, // Disable animation
  ),
  GetPage(
    name: MyRoutes.cart,
    page: () =>  const Cart(),
    transition: Transition.noTransition, // Disable animation
  ),
  GetPage(
    name: MyRoutes.search,
    page: () =>  const Search(),
    transition: Transition.noTransition, // Disable animation
  ),
  GetPage(
    name: MyRoutes.profile,
    page: () =>  const Profile(),
    transition: Transition.noTransition, // Disable animation
  ),
  GetPage(
    name: MyRoutes.navigationBarWraper,
    page: () => MyNavigationBarWraper(),
    transition: Transition.noTransition, // Disable animation
  ),
];

Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.onboarding: (_) => Onboarding(),
  MyRoutes.signInScreen: (_) => SignInScreen(),
  MyRoutes.signUpScreen: (_) => SignUpScreen(),
  MyRoutes.home: (_) =>  const Home(),
  MyRoutes.cart: (_) =>  const Cart(),
  MyRoutes.categories: (_) =>  const Categories(),
  MyRoutes.profile: (_) =>  const Profile(),
  MyRoutes.search: (_) =>  const Search(),
};
