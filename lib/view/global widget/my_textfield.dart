import 'package:flutter/material.dart';
import 'package:my_store/core/constants.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  
  const MyTextfield(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: MyColors.matteCharcoal.withOpacity(0.4))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.elsie)),
            label: Text(hintText),
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: MyColors.matteCharcoal.withOpacity(0.4))),
        obscureText: obscureText,
      ),
    );
  }
}
