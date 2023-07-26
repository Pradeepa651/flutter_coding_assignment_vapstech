import 'dart:convert';

class User {
  String username;
  String password;
  String email;
  String phoneNumber;
  String profession;

  User({
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.profession,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      password: map['password'],
      email: map['email'],
      phoneNumber: map['phone'],
      profession: map['profession'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'phone': phoneNumber,
      'profession': profession,
    };
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
