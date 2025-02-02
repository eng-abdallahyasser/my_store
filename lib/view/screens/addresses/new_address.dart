import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_store/data/model/address.dart';
import 'package:my_store/view/screens/addresses/small_map_card.dart';

class NewAddress extends StatelessWidget {
  final Address address;
  const NewAddress({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Address'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmallMapCard(location: LatLng(address.latitude, address.longitude)),
            ),
            Text(
              address.latitude.toString(),
            ),
            Text(
              address.longitude.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
