class AddressModel {
  final String address;
  final String flatNo;
  final String area;
  final String mobile;
  final String direction;
  final String city;
  final String state;
  final String pincode;
  final String type;

  AddressModel({
    required this.address,
    required this.flatNo,
    required this.area,
    required this.mobile,
    required this.direction,
    required this.city,
    required this.state,
    required this.pincode,
    required this.type,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      address: json['address'] ?? '',
      flatNo: json['flat_no'] ?? '',
      area: json['area'] ?? '',
      mobile: json['mobile'] ?? '',
      direction: json['direction'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      pincode: json['pincode'] ?? '',
      type: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'flat_no': flatNo,
      'area': area,
      'mobile': mobile,
      'direction': direction,
      'city': city,
      'state': state,
      'pincode': pincode,
      'type': type,
    };
  }

  // Optional: copyWith
  AddressModel copyWith({
    String? address,
    String? flatNo,
    String? area,
    String? mobile,
    String? direction,
    String? city,
    String? state,
    String? pincode,
    String? type,
  }) {
    return AddressModel(
      address: address ?? this.address,
      flatNo: flatNo ?? this.flatNo,
      area: area ?? this.area,
      mobile: mobile ?? this.mobile,
      direction: direction ?? this.direction,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      type: type ?? this.type,
    );
  }
}
