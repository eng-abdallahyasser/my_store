import 'package:flutter/material.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/view/screens/addresses/address.dart';
import 'package:my_store/view/screens/auth/signin.dart';
import 'package:my_store/view/screens/auth/signup.dart';
import 'package:my_store/view/screens/cart/cart.dart';
import 'package:my_store/view/screens/home/home.dart';
import 'package:my_store/view/screens/navigation%20wraper/my_navigation_bar.dart';
import 'package:my_store/view/screens/onboarding.dart';
import 'package:my_store/view/screens/profile/profile.dart';
import 'package:my_store/view/global%20widget/search.dart';
import 'package:my_store/view/screens/splash_screen/splash_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.onboarding: (_) => Onboarding(),
  MyRoutes.splashScreen: (_) => const SplashScreen(),
  MyRoutes.signInScreen: (_) => SignInScreen(),
  MyRoutes.signUpScreen: (_) => SignUpScreen(),
  MyRoutes.home: (_) => const Home(),
  MyRoutes.cart: (_) => CartScreen(),
  MyRoutes.profile: (_) => Profile(),
  MyRoutes.search: (_) => const Search(),
  MyRoutes.navigationBarWraper: (_) => MyNavigationBarWraper(),
  MyRoutes.addressScreen: (_)=> const AddressScreen(),
};
