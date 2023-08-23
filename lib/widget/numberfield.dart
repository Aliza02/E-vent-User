import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant.dart';

// ignore: must_be_immutable
class NumberField extends StatefulWidget {
  String title;
  int maxLength;
  TextEditingController phoneController = TextEditingController();

  NumberField(
      {super.key,
      required this.title,
      required this.maxLength,
      required this.phoneController});

  @override
  State<NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.phoneController,
      maxLength: widget.maxLength,
      cursorColor: const Color(0xFFCB585A),
      textAlign: widget.maxLength == 11 ? TextAlign.start : TextAlign.center,
      keyboardType: TextInputType.number,
      // controller: widget.textcontroller,
      decoration: InputDecoration(
        fillColor: const Color(0xFFEFEFEF).withOpacity(0.5),
        filled: true,
        hintText: widget.title,
        counterText: "",
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
