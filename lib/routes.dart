import 'package:flutter/material.dart';
import 'package:my_store/view/screens/auth/signin_or_signup.dart';
import 'package:my_store/view/screens/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes = {

  "/auth": (_) => const Auth(),
  "/onboarding": (_) => Onboarding(),
};
