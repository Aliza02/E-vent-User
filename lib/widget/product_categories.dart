import 'package:flutter/material.dart';

import '../constants/constant.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.description,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,

      // maxLines: 3,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: Color(constant.lightGrey),
        fontSize: 12,
        fontFamily: constant.font,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
