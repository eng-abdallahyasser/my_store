import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/address_controller.dart';
import 'package:my_store/data/data_source/static.dart';
import 'package:my_store/view/screens/addresses/address_cart.dart';

class AddressScreen extends StatelessWidget {
  final AddressController controller = Get.put(AddressController());
  AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Addresses"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tempAddresses.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () => {controller.onTapAddress(tempAddresses[index])},
                  child: AddressCart(address: tempAddresses[index])),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {controller.addNewAddress()},
        child: const Icon(Icons.add),
      ),
    );
  }
}
