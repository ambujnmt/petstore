class UserModel {
  final int id;
  final String displayName;
  final String email;
  final String mobile;

  UserModel({
    required this.id,
    required this.displayName,
    required this.email,
    required this.mobile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      displayName: json['display_name'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'display_name': displayName,
      'email': email,
      'mobile': mobile,
    };
  }

  // copyWith method
  UserModel copyWith({
    int? id,
    String? displayName,
    String? email,
    String? mobile,
  }) {
    return UserModel(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
    );
  }
}
