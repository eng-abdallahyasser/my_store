import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:my_store/data/data_source/static.dart';
import 'package:my_store/data/model/address.dart';
import 'package:my_store/view/screens/addresses/address_detailes.dart';
import 'package:my_store/view/screens/addresses/new_address.dart';

class AddressController extends GetxController {
  List<Address> addresses = tempAddresses;
  Address newAddress = Address(
      name: "temp",
      latitude: 0,
      longitude: 0,
      address: "temp",
      phoneNumber: "temp");

  onTapAddress(Address addressTapped) {
    Get.to(() => AddressDetails(address: addressTapped));
  }

  addNewAddress() async {
    Get.defaultDialog(
        title: 'Finding your location',
        content: const CircularProgressIndicator());
  
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.deniedForever) {
        Get.back();
        Get.defaultDialog(
          title: 'ERROR',
          content: const Text(
              'Location Permission are permanently denied, we cannot request permission again but you can check permissions by going to settings > apps > permissions'),
        );
      }
      await Geolocator.getCurrentPosition().then((value) {
        newAddress.latitude = value.latitude;
        newAddress.longitude = value.longitude;
      });
      Get.back();
      Get.to(() => NewAddress(address: newAddress));
    
  }
}
