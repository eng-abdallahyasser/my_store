import 'package:flutter/material.dart';
import 'package:my_store/core/constant/colors.dart';
import 'package:my_store/data/data_source/static.dart';
import 'package:my_store/data/model/onboarding.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.white,
        body: PageView.builder(
          itemCount: onboardingList.length,
          itemBuilder: (context, index) {
            return OnboardingPage(
              data: onboardingList[index],
            );
          },
        ));
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Image.asset(data.imageAssetPath),
        ),
        const SizedBox(height: 20),
        Text(
          data.title,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            data.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: MyColors.gray),
          ),
        ),
      ],
    );
  }
}
