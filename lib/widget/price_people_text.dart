import 'package:flutter/material.dart';

import '../constants/constant.dart';

class PriceAndPeopleText extends StatelessWidget {
  const PriceAndPeopleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Price',
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: const Color(0x7F555454),
            fontSize: 12,
            fontFamily: constant.font,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Person',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: const Color(0x7F555454),
            fontSize: 12,
            fontFamily: constant.font,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
