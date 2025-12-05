class PetModel {
  final String id;
  final String name;
  final String price;
  final int stock;
  final String stockStatus;
  final String image;
  final String color;
  final String colorHex;
  final String gender;
  final String age;
  final String species;
  final String description;
  final String shortDescription;
  final Map<String, List<String>> attributes;

  PetModel({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.stockStatus,
    required this.image,
    required this.color,
    required this.colorHex,
    required this.gender,
    required this.age,
    required this.species,
    required this.description,
    required this.shortDescription,
    required this.attributes,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      price: json['price'] ?? '',
      stock: json['stock'] ?? 0,
      stockStatus: json['stock_status'] ?? '',
      image: json['image'] ?? '',
      color: nullOrEmptyToNA(json['color']),
      colorHex: json['color_hex'] ?? '',
      gender: nullOrEmptyToNA(json['gender']),
      age: nullOrEmptyToNA(json['age'], customText: '_'),
      species: json['species'] ?? '',
      description: json['description'] ?? '',
      shortDescription: json['short_description'] ?? '',
      attributes: _parseAttributes(json['attributes']),
    );
  }

  static Map<String, List<String>> _parseAttributes(dynamic raw) {
    if (raw == null || raw is! Map) return {};

    final Map<String, List<String>> parsed = {};

    raw.forEach((key, value) {
      if (value is List) {
        parsed[key] = value.map((e) => e.toString()).toList();
      }
    });

    return parsed;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
      'stock_status': stockStatus,
      'image': image,
      'color': color,
      'color_hex': colorHex,
      'gender': gender,
      'age': age,
      'species': species,
      'description': description,
      'short_description': shortDescription,
      'attributes': attributes,
    };
  }
}

String nullOrEmptyToNA(dynamic value, {String? customText}) {
  if (value == null) return customText ?? 'N/A';
  if (value.toString().trim().isEmpty) return customText ?? 'N/A';
  return value.toString();
}
