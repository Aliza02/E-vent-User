import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';

class OrderLocation extends StatelessWidget {
  const OrderLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.width * .18,
          child: Text(
            'Location',
            style: TextStyle(
              color: const Color(0xFF555454),
              fontSize: 14,
              fontFamily: constant.font,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          // width: 258,
          child: Text(
            softWrap: true,
            maxLines: 2,
            'XYZ building XZ block, Latifabad, Hyd. ',
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
