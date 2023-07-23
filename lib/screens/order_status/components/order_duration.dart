import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';

class OrderDuration extends StatelessWidget {
  const OrderDuration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * .18,
          child: Text(
            'Duration',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: const Color(0xFF555454),
              fontSize: 14,
              fontFamily: constant.font,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          '6:00 pm to 12:00 am',
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Color(constant.red),
            fontSize: 16,
            fontFamily: constant.font,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
