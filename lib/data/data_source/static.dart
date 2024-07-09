import 'package:flutter/material.dart';
import 'package:my_store/core/constants.dart';
import 'package:my_store/data/model/Product.dart';
import 'package:my_store/data/model/bottom_bar_destination.dart';
import 'package:my_store/data/model/onboarding.dart';
import 'package:my_store/data/data_source/repo.dart';
import 'package:my_store/view/screens/cart/cart.dart';
import 'package:my_store/view/screens/favourite/favourites_screen.dart';
import 'package:my_store/view/screens/home/home.dart';
import 'package:my_store/view/screens/profile/profile.dart';

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
    icon: "assets/icons/Shop Icon.svg",
    route: MyRoutes.home,
    label: "Home",
    routeWidget: const Home(),
  ),
  BottomBarDestination(
    icon: "assets/icons/Heart Icon.svg",
    route: MyRoutes.categories,
    label: "Favourites",
    routeWidget: const FavouritesScreen(),
  ),
  BottomBarDestination(
    icon: "assets/icons/Cart Icon.svg",
    route: MyRoutes.cart,
    label: "Cart",
    routeWidget: CartScreen(),
  ),
  BottomBarDestination(
    icon: "assets/icons/User Icon.svg",
    route: MyRoutes.profile,
    label: "Profile",
    routeWidget: const Profile(),
  )
];

Future<List<Product>> demoProducts = Repo.getAllProduct();
// [
//   Product(
//       images: [
//         "assets/images/ps4_console_white_1.png",
//         "assets/images/ps4_console_white_2.png",
//         "assets/images/ps4_console_white_3.png",
//         "assets/images/ps4_console_white_4.png",
//       ],
//       colors: [
//         const Color(0xFFF6625E),
//         const Color(0xFF836DB8),
//         const Color(0xFFDECB9C),
//         Colors.white,
//       ],
//       title: "Wireless Controller for PS4™",
//       price: 64.99,
//       description: description,
//       rating: 4.8,
//       isFavourite: true,
//       isPopular: true),
//   Product(
//       images: [
//         "assets/images/Image Popular Product 2.png",
//       ],
//       colors: [
//         const Color(0xFFF6625E),
//         const Color(0xFF836DB8),
//         const Color(0xFFDECB9C),
//         Colors.white,
//       ],
//       title: "Nike Sport White - Man Pant",
//       price: 50.5,
//       description: description,
//       rating: 4.1,
//       isPopular: true),
//   Product(
//       images: [
//         "assets/images/glap.png",
//         "assets/images/glap.png",
//         "assets/images/glap.png",
//         "assets/images/glap.png",
//         "assets/images/glap.png",
//         "assets/images/glap.png",
//         "assets/images/glap.png",
//       ],
//       colors: [
//         const Color(0xFFF6625E),
//         const Color(0xFF836DB8),
//         const Color(0xFFDECB9C),
//         Colors.white,
//       ],
//       title: "Gloves XC Omega - Polygon",
//       price: 36.55,
//       description: description,
//       rating: 4.1,
//       isFavourite: true,
//       isPopular: true),
//   Product(
//       images: [
//         "assets/images/wireless headset.png",
//         "assets/images/wireless headset.png",
//         "assets/images/wireless headset.png",
//       ],
//       colors: [
//         const Color(0xFFF6625E),
//         const Color(0xFF836DB8),
//         const Color(0xFFDECB9C),
//         Colors.white,
//       ],
//       title: "Logitech Head",
//       price: 20.20,
//       description: description,
//       rating: 4.1,
//       isFavourite: true),
//   Product(
//       images: [
//         "assets/images/ps4_console_white_1.png",
//         "assets/images/ps4_console_white_2.png",
//         "assets/images/ps4_console_white_3.png",
//         "assets/images/ps4_console_white_4.png",
//       ],
//       colors: [
//         const Color(0xFFF6625E),
//         const Color(0xFF836DB8),
//         const Color(0xFFDECB9C),
//         Colors.white,
//       ],
//       title: "Wireless Controller for PS4™",
//       price: 64.99,
//       description: description,
//       rating: 4.8,
//       isFavourite: true,
//       isPopular: true),
//   Product(
//       images: [
//         "assets/images/Image Popular Product 2.png",
//       ],
//       colors: [
//         const Color(0xFFF6625E),
//         const Color(0xFF836DB8),
//         const Color(0xFFDECB9C),
//         Colors.white,
//       ],
//       title: "Nike Sport White - Man Pant",
//       price: 50.5,
//       description: description,
//       rating: 4.1,
//       isPopular: true),
//   Product(
//       images: [
//         "assets/images/glap.png",
//       ],
//       colors: [
//         const Color(0xFFF6625E),
//         const Color(0xFF836DB8),
//         const Color(0xFFDECB9C),
//         Colors.white,
//       ],
//       title: "Gloves XC Omega - Polygon",
//       price: 36.55,
//       description: description,
//       rating: 4.1,
//       isFavourite: true,
//       isPopular: true),
//   Product(
//       images: [
//         "assets/images/wireless headset.png",
//       ],
//       colors: [
//         const Color(0xFFF6625E),
//         const Color(0xFF836DB8),
//         const Color(0xFFDECB9C),
//         Colors.white,
//       ],
//       title: "Logitech Head",
//       price: 20.20,
//       description: description,
//       rating: 4.1,
//       isFavourite: true),
// ];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

List<Product> favouriteProducts = [
  Product(
      imagesUrl: [
        "assets/images/ps4_console_white_1.png",
        "assets/images/ps4_console_white_2.png",
        "assets/images/ps4_console_white_3.png",
        "assets/images/ps4_console_white_4.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Wireless Controller for PS4™",
      price: 64.99,
      description: description,
      rating: 4.8,
      isFavourite: true,
      isPopular: true),
];
