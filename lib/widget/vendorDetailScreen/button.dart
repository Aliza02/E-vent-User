import 'package:eventually_user/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  const Button({super.key, required this.label, required this.onPressed});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 10.0,
        shadowColor: const Color(0xFFCB585A).withOpacity(0.4),
        backgroundColor: const Color(0xFFCB585A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(widget.label,
          style: TextStyle(
            fontFamily: constant.font,
            fontWeight: FontWeight.w600,
            fontSize: Get.width * 0.04,
            color: Colors.white,
          )),
    );
  }
}
