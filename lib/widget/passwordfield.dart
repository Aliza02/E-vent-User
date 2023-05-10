import 'package:eventually_user/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/constant.dart';

class PasswordField extends StatefulWidget {
  // TextEditingController passwordcontroller;
  String title;
  PasswordField({required this.title});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TextFormField(
      // controller: widget.passwordcontroller,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Color(0xFFEFEFEF).withOpacity(0.5),
        filled: true,
        hintText: widget.title,
        hintStyle: TextStyle(
          fontFamily: constant.font,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(width * 0.04),
          borderSide: BorderSide(
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
          ),
        ),
      ),
    );
  }
}
