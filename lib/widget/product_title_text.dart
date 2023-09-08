import 'package:flutter/material.dart';

import '../constants/constant.dart';

class ProductTitleText extends StatelessWidget {
  final String title;
  const ProductTitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Color(constant.black),
        fontSize: 24,
        fontFamily: constant.font,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
