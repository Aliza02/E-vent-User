import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/constant.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({super.key});

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.circular(width * 0.07),
        border: Border.all(
          color: Color(0xFFEBE9F1),
          width: 1.3,
        ),
      ),
      height: height * 0.09,
      width: width * 0.2,
      child: Image.asset("assets/images/google-logo.png"),
    );
  }
}
