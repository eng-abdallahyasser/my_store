import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  const MyButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF7f30fe),
              Color(0xFF6380fb),
            ],
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}