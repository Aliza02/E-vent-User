import 'package:flutter/material.dart';

class PriceAndPeopleText extends StatelessWidget {
  const PriceAndPeopleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Price',
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Color(0x7F555454),
            fontSize: 12,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Person',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0x7F555454),
            fontSize: 12,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
