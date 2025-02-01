import 'package:get/get.dart';
import 'package:my_store/data/data_source/static.dart';
import 'package:my_store/data/model/address.dart';
import 'package:my_store/view/screens/addresses/address_detailes.dart';

class AddressController extends GetxController{
  List<Address> addresses=tempAddresses;


  onTapAddress(Address addressTapped) {
    Get.to(()=>AddressDetails(address: addressTapped));
  }

}