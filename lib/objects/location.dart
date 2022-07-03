class YelpLocation {
  YelpLocation.fromMap(Map<String, dynamic> data)
      : address1 = data["address1"] as String,
        address2 = data["address2"] as String,
        address3 = data["address3"] as String,
        city = data["city"] as String,
        state = data["state"] as String,
        postalCode = data["postal_code"] as String,
        country = data["country"] as String,
        formattedAddress = data["formatted_address"] as String;

  final String address1;
  final String address2;
  final String address3;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String formattedAddress;
}
