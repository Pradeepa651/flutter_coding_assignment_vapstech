import 'package:flutter/material.dart';
import 'package:flutter_coding_assignment_vapstech/Model/Database.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_coding_assignment_vapstech/commonWidgets/InputField.dart';
import 'package:flutter_coding_assignment_vapstech/commonWidgets/Button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/User.dart';
import '../ModelView/FormValidationLogic.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _logInFormKey = GlobalKey<FormState>();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void _login(context) async {
    User? user = await _databaseHelper.getUser(
        usernameController.text, passwordController.text);
    final SharedPreferences prefs = await _prefs;

    if (user != null) {
      Navigator.pushNamedAndRemoveUntil(context, '/Movies', (route) => false);
      prefs.setString('User', user.toJson());
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Invalid username or password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 53, horizontal: 43).r,
          child: Form(
            key: _logInFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InputField(
                  label: 'Username',
                  controller: usernameController,
                  formValidation: nameTextValidation,
                ),
                InputField(
                    label: 'Password',
                    controller: passwordController,
                    formValidation: passwordTextValidation),
                SizedBox(
                  height: 10.h,
                ),
                Button(
                    text: 'Log In',
                    action: () {
                      if (_logInFormKey.currentState?.validate() ?? false) {
                        _login(context);
                      }
                    }),
                SizedBox(
                  height: 14.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
