class AddressList {
  final List<Address> addresses;

  AddressList({
    required this.addresses,
  });

  // Factory constructor to create an instance from JSON
  factory AddressList.fromJson(List<dynamic> json) {
    List<Address> addresses = <Address>[];
    addresses = json.map((address) => Address.fromJson(address)).toList();

    return AddressList(
      addresses: addresses,
    );
  }

  // Method to convert an instance to JSON
  List<Map<String, dynamic>> toJson() {
    return addresses.map((address) => address.toJson()).toList();
  }
}

class Address {
  final int id;
  final String customerId;
  final bool isGuest;
  final String contactPersonName;
  final String? email;
  final String addressType;
  final String address;
  final String city;
  final String zip;
  final String phone;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? state;
  final String country;
  final String latitude;
  final String longitude;
  final bool isBilling;

  Address({
    required this.id,
    required this.customerId,
    required this.isGuest,
    required this.contactPersonName,
    this.email,
    required this.addressType,
    required this.address,
    required this.city,
    required this.zip,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.isBilling,
  });

  // Factory constructor to create an instance from JSON
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      customerId: json['customer_id'],
      isGuest: json['is_guest'],
      contactPersonName: json['contact_person_name'],
      email: json['email'],
      addressType: json['address_type'],
      address: json['address'],
      city: json['city'],
      zip: json['zip'],
      phone: json['phone'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      state: json['state'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      isBilling: json['is_billing'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer_id': customerId,
      'is_guest': isGuest,
      'contact_person_name': contactPersonName,
      'email': email,
      'address_type': addressType,
      'address': address,
      'city': city,
      'zip': zip,
      'phone': phone,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'state': state,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'is_billing': isBilling,
    };
  }
}
