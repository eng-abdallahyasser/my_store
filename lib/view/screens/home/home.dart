import 'package:flutter/material.dart';
import 'package:my_store/view/screens/home/home_header.dart';
import 'package:my_store/view/global%20widget/product_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Column(
      children: [
        SizedBox(height: 20),
        HomeHeader(),
        ProductList(),
      ],
    ));
  }
}
