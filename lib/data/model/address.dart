import 'dart:convert';

class Address {
  String name;
  double latitude;
  double longitude;
  String address;
  String phoneNumber;
  Address({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.phoneNumber,
  });


  Address copyWith({
    String? name,
    double? latitude,
    double? longitude,
    String? address,
    String? phoneNumber,
  }) {
    return Address(
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      name: map['name'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      address: map['address'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(name: $name, latitude: $latitude, longitude: $longitude, address: $address, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.address == address &&
      other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      address.hashCode ^
      phoneNumber.hashCode;
  }
}
