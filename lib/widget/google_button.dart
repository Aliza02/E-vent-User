import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({super.key});

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.circular(width * 0.07),
        border: Border.all(
          color: const Color(0xFFEBE9F1),
          width: 1.3,
        ),
      ),
      height: Get.height * 0.09,
      width: Get.width * 0.2,
      child: Image.asset("assets/images/google-logo.png"),
    );
  }
}
