import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';

class OrderDuration extends StatelessWidget {
  final String startTime;
  final String endTime;
  const OrderDuration({
    super.key,
    required this.startTime,
    required this.endTime,
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
              color: Color(constant.lightGrey),
              fontSize: 14,
              fontFamily: constant.font,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          "${startTime} - ${endTime}",
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
