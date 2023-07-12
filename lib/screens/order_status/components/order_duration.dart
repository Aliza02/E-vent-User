import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          child: const Text(
            'Duration',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Color(0xFF555454),
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Text(
          '6:00 pm to 12:00 am',
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Color(0xFFCB585A),
            fontSize: 16,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
