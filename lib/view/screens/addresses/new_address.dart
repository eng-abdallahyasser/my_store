import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_store/controller/address_controller.dart';
import 'package:my_store/data/model/address.dart';
import 'package:my_store/view/global%20widget/my_textfield.dart';
import 'package:my_store/view/screens/addresses/small_map_card.dart';

class NewAddress extends StatelessWidget {
  final AddressController controller = Get.find();
  final Address address;
  final TextEditingController addressController;
  final TextEditingController phoneController;


   NewAddress(
      {super.key,
      required this.address,
      required this.addressController,
      required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Address'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SmallMapCard(
                    location: LatLng(address.latitude, address.longitude)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "latitude = ${address.latitude.toString()} & longitude = ${address.longitude.toString()}",
                  ),
                ),
              ),
              MyTextfield(hintText: "Your Address", controller: addressController),
              MyTextfield(hintText: "Phone Number", controller: phoneController ,keyboardType: TextInputType.phone,),
              Spacer(),
              ElevatedButton(
                onPressed:(){ controller.onSaveNewAddressClicked(address); },
                child: const Text('Save'),
              )
        
            ],
          ),
        ),
      ),
    );
  }
}
