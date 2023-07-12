import 'package:flutter/material.dart';

import '../constants/constant.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Shadi Package',
      style: TextStyle(
        color: Color(constant.black),
        fontSize: 24,
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
