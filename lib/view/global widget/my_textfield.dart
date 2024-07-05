import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const MyTextfield(
      {super.key, required this.hintText, required this.controller, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF7f30fe))),
          label: Text(hintText),
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w400, color: Colors.black38)),
              obscureText: obscureText,
    );
  }
}