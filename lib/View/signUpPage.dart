import 'package:flutter_coding_assignment_vapstech/Model/Database.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Model/User.dart';
import '../commonWidgets/Button.dart';
import '../commonWidgets/InputField.dart';

import '../ModelView/FormValidationLogic.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController reEnterPassword = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<String> professions = ['Engineer', 'Doctor', 'Teacher', 'Others'];

  String? _selectedProfession;
  final _signUpFormKey = GlobalKey<FormState>();

  void _signup(context) async {
    User user = User(
        username: username.text,
        password: password.text,
        email: emailController.text,
        profession: _selectedProfession.toString(),
        phoneNumber: phoneNumberController.text);
    if (await _databaseHelper.saveUser(user) == -1) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('User already exist'),
          content: const Text('You can now login with your credentials.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Signup Successful'),
          content: const Text('You can now login with your credentials.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      Navigator.pushNamedAndRemoveUntil(context, '/Movies', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 38, left: 40, right: 40, bottom: 57).r,
        child: Form(
          key: _signUpFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 25.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'SignUp',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              InputField(
                label: "UserName",
                controller: username,
                formValidation: nameTextValidation,
              ),
              InputField(
                label: " Email",
                controller: emailController,
                formValidation: emailTextValidation,
              ),
              DropdownButtonFormField<String>(
                value: _selectedProfession,
                onChanged: (value) {
                  setState(() {
                    _selectedProfession = value;
                  });
                },
                items:
                    professions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                    label: Text(
                      'Profession',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14))),
              ),
              SizedBox(
                height: 15.h,
              ),
              InputField(
                  label: 'Phone Number',
                  controller: phoneNumberController,
                  formValidation: phoneNumberValidation),
              InputField(
                label: " Password",
                formValidation: passwordTextValidation,
                controller: password,
              ),
              InputField(
                label: " Re-enter Password",
                controller: reEnterPassword,
                obscureText: true,
                formValidation: (value) {
                  return reEnterPasswordTextValidation(
                      value, password.text.toString().trim());
                },
              ),
              SizedBox(
                height: 25.h,
              ),
              Button(
                  text: 'Sign Up',
                  action: () {
                    if (_signUpFormKey.currentState?.validate() ?? false) {
                      _signup(context);
                    }
                  }),
              SizedBox(
                height: 25.h,
              ),
              Button(
                text: 'Login in',
                action: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    username.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    password.dispose();
    reEnterPassword.dispose();
    super.dispose();
  }
}
