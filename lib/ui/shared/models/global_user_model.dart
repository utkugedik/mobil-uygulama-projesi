import 'dart:convert';

class GlobalUserModel {
  String email;
  String username;
  String? profilePicture;
  GlobalUserModel({
    this.email = "",
    this.username = "",
    this.profilePicture,
  });

  GlobalUserModel copyWith({
    String? email,
    String? username,
    String? profilePicture,
  }) {
    return GlobalUserModel(
      email: email ?? this.email,
      username: username ?? this.username,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'profilePicture': profilePicture,
    };
  }

  factory GlobalUserModel.fromMap(Map<String, dynamic> map) {
    return GlobalUserModel(
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      profilePicture: map['profilePicture'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GlobalUserModel.fromJson(String source) => GlobalUserModel.fromMap(json.decode(source));

  @override
  String toString() => 'GlobalUserModel(email: $email, username: $username, profilePicture: $profilePicture)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GlobalUserModel && other.email == email && other.username == username && other.profilePicture == profilePicture;
  }

  @override
  int get hashCode => email.hashCode ^ username.hashCode ^ profilePicture.hashCode;
}
