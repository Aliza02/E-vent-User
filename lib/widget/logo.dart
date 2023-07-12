import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Logo extends StatelessWidget {
  double width;
  double height;

  Logo({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: width,
      height: height,
      "assets/images/logo.png",
    );
  }
}
