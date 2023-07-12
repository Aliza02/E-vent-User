import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  String title;

  CustomTextFormField({super.key, required this.title});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      // controller: widget.textcontroller,
      decoration: InputDecoration(
        fillColor: const Color(0xFFEFEFEF).withOpacity(0.5),
        filled: true,
        hintText: widget.title,
        hintStyle: TextStyle(
          fontSize: Get.width * 0.04,
          color: Colors.grey,
          fontFamily: constant.font,
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
      ),
    );
  }
}
