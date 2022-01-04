import 'dart:convert';

class SignUpDataModel {
  String email;
  String username;
  String birthDate;
  String password;
  String verificationCode;

  SignUpDataModel({
    this.email = "",
    this.username = "",
    this.birthDate = "",
    this.password = "",
    this.verificationCode = "",
  });

  SignUpDataModel copyWith({
    String? email,
    String? username,
    String? birthDate,
    String? password,
    String? verificationCode,
  }) {
    return SignUpDataModel(
      email: email ?? this.email,
      username: username ?? this.username,
      birthDate: birthDate ?? this.birthDate,
      password: password ?? this.password,
      verificationCode: verificationCode ?? this.verificationCode,
    );
  }

  /// !!! Warning: Modified according to the Backend request. Copy and paste this part after auto generating!
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'birth_date': birthDate,
      'password': password,
      'code': verificationCode,
    };
  }

  factory SignUpDataModel.fromMap(Map<String, dynamic> map) {
    return SignUpDataModel(
      email: map['email'],
      username: map['username'],
      birthDate: map['birth_date'],
      password: map['password'],
      verificationCode: map['code'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpDataModel.fromJson(String source) => SignUpDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignUpDataModel(email: $email, username: $username, birthDate: $birthDate, password: $password, verificationCode: $verificationCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpDataModel && other.email == email && other.username == username && other.birthDate == birthDate && other.password == password && other.verificationCode == verificationCode;
  }

  @override
  int get hashCode {
    return email.hashCode ^ username.hashCode ^ birthDate.hashCode ^ password.hashCode ^ verificationCode.hashCode;
  }
}
