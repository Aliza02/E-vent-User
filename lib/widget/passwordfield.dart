import 'package:eventually_user/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PasswordField extends StatefulWidget {
  // TextEditingController passwordcontroller;
  String title;
  TextEditingController passwordController = TextEditingController();
  PasswordField(
      {super.key, required this.title, required this.passwordController});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: const Color(0xFFEFEFEF).withOpacity(0.5),
        filled: true,
        hintText: widget.title,
        hintStyle: TextStyle(
          fontFamily: constant.font,
          color: Colors.grey,
          fontSize: Get.width * 0.04,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Get.width * 0.02),
          borderSide: const BorderSide(
            color: Color(0xFFCB585A),
            width: 1.3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Get.width * 0.02),
          borderSide: const BorderSide(
            color: Color(0xFFCB585A),
            width: 1.3,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText == true
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.grey,
            size: Get.width * 0.05,
          ),
        ),
      ),
    );
  }
}
