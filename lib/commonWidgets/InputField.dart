import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final dynamic formValidation;

  bool obscureText;

  InputField({
    Key? key,
    required this.label,
    required this.controller,
    required this.formValidation,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: const TextStyle(color: Colors.brown),
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: formValidation,
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
              label: Text(
                label,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(14))),
        ),
        SizedBox(
          height: 15.h,
        )
      ],
    );
  }
}
