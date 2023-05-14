import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/constant.dart';

class numberField extends StatefulWidget {
  String title;
  int maxLength;

  numberField({required this.title, required this.maxLength});

  @override
  State<numberField> createState() => _numberFieldState();
}

class _numberFieldState extends State<numberField> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return TextFormField(
      maxLength: widget.maxLength,
      cursorColor: Color(0xFFCB585A),
      textAlign: widget.maxLength == 11 ? TextAlign.start : TextAlign.center,
      keyboardType: TextInputType.number,
      // controller: widget.textcontroller,
      decoration: InputDecoration(
        fillColor: Color(0xFFEFEFEF).withOpacity(0.5),
        filled: true,
        hintText: widget.title,
        counterText: "",
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
