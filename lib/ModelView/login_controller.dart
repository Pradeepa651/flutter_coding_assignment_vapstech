import 'package:flutter_coding_assignment_vapstech/Model/Database.dart';

import '../Model/User.dart';

login(
    {required String name,
    required String password,
    required var databaseHelper}) async {
  DatabaseHelper data = DatabaseHelper();
  return await data.getLoginUser(name, password);
}

signUp({
  required String uname,
  required String email,
  required String password,
  required String profession,
  required String phoneNumber,
  required var database,
}) async {
  User user = User(
      name: uname,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      profession: profession);
  return await database.saveData(user);
}
