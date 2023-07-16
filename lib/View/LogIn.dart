import 'package:flutter/material.dart';
import 'package:flutter_coding_assignment_vapstech/Model/Database.dart';

import 'package:flutter_coding_assignment_vapstech/View/Movies.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_coding_assignment_vapstech/commonWidgets/InputField.dart';
import 'package:flutter_coding_assignment_vapstech/commonWidgets/Button.dart';

import '../ModelView/FormValidationLogic.dart';
import '../ModelView/login_controller.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _logInFormKey = GlobalKey<FormState>();

  @override
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
                  controller: nameController,
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
                    action: () async {
                      var res = await login(
                        name: nameController.text,
                        password: passwordController.text,
                        databaseHelper: DatabaseHelper(),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login successful')));
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/Movies', (route) => false);
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
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
