import 'package:flutter/material.dart';
import 'package:my_store/core/constant/images.dart';
import 'package:my_store/core/constant/routes.dart';
import 'package:my_store/data/model/bottom_bar_destination.dart';
import 'package:my_store/data/model/onboarding.dart';

List<OnboardingData> onboardingList = [
  OnboardingData(
    title: 'Find Favorite Items',
    description:
        'Easily search and discover your favorite products from a wide range of categories. Our platform offers personalized recommendations to help you find exactly what you\'re looking for.',
    imageAssetPath: MyImages.onBoardingImage1,
  ),
  OnboardingData(
    title: 'Easy and Safe Payment',
    description:
        'Experience secure and convenient payment options for a hassle-free shopping experience. Choose from multiple payment methods and rest assured that your transactions are protected.',
    imageAssetPath: MyImages.onBoardingImage2,
  ),
  OnboardingData(
    title: 'Product Delivery',
    description:
        'Get your products delivered swiftly and safely to your doorstep. We ensure timely delivery and provide real-time tracking updates so you can stay informed every step of the way.',
    imageAssetPath: MyImages.onBoardingImage3,
  ),
];

List<BottomBarDestination> bottomBarDestinations = [
  BottomBarDestination(
      index: 0,
      icon: const Icon(Icons.home_rounded),
      label: 'Home',
      route: MyRoutes.home),
  BottomBarDestination(
      index: 1,
      icon: const Icon(Icons.category),
      label: 'Groups',
      route: MyRoutes.categories),
  BottomBarDestination(
      index: 2,
      icon: const Icon(Icons.search_outlined),
      label: 'Search',
      route: MyRoutes.search),
  BottomBarDestination(
      index: 3,
      icon: const Icon(Icons.shopping_cart_rounded),
      label: 'Cart',
      route: MyRoutes.cart),
  BottomBarDestination(
      index: 4,
      icon: const Icon(Icons.person_2),
      label: 'Profile',
      route: MyRoutes.profile)
];
