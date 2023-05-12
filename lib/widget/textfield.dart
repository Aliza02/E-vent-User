import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/constant.dart';

class textFormField extends StatefulWidget {
  String title;

  textFormField({required this.title});

  @override
  State<textFormField> createState() => _textFormFieldState();
}

class _textFormFieldState extends State<textFormField> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      // controller: widget.textcontroller,
      decoration: InputDecoration(
        fillColor: Color(0xFFEFEFEF).withOpacity(0.5),
        filled: true,
        hintText: widget.title,
        hintStyle: TextStyle(
          fontSize: width * 0.04,
          color: Colors.grey,
          fontFamily: constant.font,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(width * 0.02),
          borderSide: BorderSide(
            color: Color(0xFFCB585A),
            width: 1.3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(width * 0.02),
          borderSide: BorderSide(
            color: Color(0xFFCB585A),
            width: 1.3,
          ),
        ),
      ),
    );
  }
}
