class UserModel {
  final String uid;
  final String email;
  final String name;
  final String phoneNumber;
  final double balance;
  final bool isVerified;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.phoneNumber,
    this.balance = 0.0,
    this.isVerified = false,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      balance: (json['balance'] ?? 0.0).toDouble(),
      isVerified: json['isVerified'] ?? false,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'balance': balance,
      'isVerified': isVerified,
      'createdAt': createdAt.toIso8601String(),
    };
  }
} 