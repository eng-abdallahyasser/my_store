import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  final void Function() togglePages;

  const SignupScreen({super.key, required this.togglePages});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("sing up "),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(onPressed: togglePages)
          ],
        ),
      ),
    );
  }
}
