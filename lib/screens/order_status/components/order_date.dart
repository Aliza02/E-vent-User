import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';

class OrderDate extends StatelessWidget {
  const OrderDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.width * .18,
          child: Text(
            'Date',
            style: TextStyle(
              color: Color(constant.lightGrey),
              fontSize: 14,
              fontFamily: constant.font,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: Text(
            '21/05/2023',
            style: TextStyle(
              color: Color(constant.red),
              fontSize: 16,
              fontFamily: constant.font,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
