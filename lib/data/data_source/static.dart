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
      icon: "assets/icons/Shop Icon.svg",
      route: MyRoutes.home),
  BottomBarDestination(
      index: 1,
      icon: "assets/icons/Heart Icon.svg",
      route: MyRoutes.categories),
  BottomBarDestination(
      index: 2,
      icon: "assets/icons/Search Icon.svg",
      route: MyRoutes.search),
  BottomBarDestination(
      index: 3,
      icon: "assets/icons/Cart Icon.svg",
      route: MyRoutes.cart),
  BottomBarDestination(
      index: 4,
      icon: "assets/icons/User Icon.svg",
      route: MyRoutes.profile)
];
