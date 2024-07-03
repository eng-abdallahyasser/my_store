import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  final void Function() togglePages;

  const SigninScreen({super.key, required this.togglePages});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("sing in "),
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
