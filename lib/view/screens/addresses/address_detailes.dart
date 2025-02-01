import 'package:flutter/material.dart';
import 'package:my_store/data/model/address.dart';

class AddressDetails extends StatelessWidget {
  final Address address;
  const AddressDetails({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(address.address)));
  }
}