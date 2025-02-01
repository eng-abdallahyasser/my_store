import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("My Addresses"),
      ),
       body: const SingleChildScrollView(
        child: Column(
            children: [
                SizedBox(height: 20),
                Text("Add New Address"),
                SizedBox(height: 20),
            ]
       )
      ));
  }
}