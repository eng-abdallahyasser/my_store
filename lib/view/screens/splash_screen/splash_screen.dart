import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/data/data_source/repo.dart';
import 'package:my_store/firebase/auth.dart';
import 'package:my_store/view/screens/auth/signin.dart';
import 'package:my_store/view/screens/navigation%20wraper/my_navigation_bar.dart';
import 'package:my_store/view/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = Auth();
  @override
  void initState() {
    Timer(const Duration(milliseconds: 2500), () {
      Get.off(() => Repo.onboardingShown ? _authGate() : Onboarding());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Image.asset("assets/images/joe store logo2.png"),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text("Developed by Eng"),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "ABDALLAH YASSER",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1B262C)),
              ),
            ],
          ),
        ));
  }

  Widget _authGate() {
    return FutureBuilder(
        future: _auth.getCurrentUserFuture(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return MyNavigationBarWraper();
          } else {
            return SignInScreen();
          }
        });
  }
}
