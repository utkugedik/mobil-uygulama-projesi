import 'dart:convert';

class LoginDataModel {
  String email;
  String password;

  LoginDataModel({
    this.email = "",
    this.password = "",
  });

  LoginDataModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginDataModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginDataModel.fromMap(Map<String, dynamic> map) {
    return LoginDataModel(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginDataModel.fromJson(String source) => LoginDataModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginDataModel(email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginDataModel && other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
