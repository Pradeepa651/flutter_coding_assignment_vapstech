class User {
  String name;
  String password;
  String email;
  String phoneNumber;
  String profession;

  User({
    required this.name,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.profession,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      password: map['password'],
      email: map['email'],
      phoneNumber: map['phone'],
      profession: map['profession'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
      'email': email,
      'phone': phoneNumber,
      'profession': profession,
    };
  }
}
