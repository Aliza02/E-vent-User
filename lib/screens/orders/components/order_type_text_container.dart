import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';

class OrderTypeTextContainer extends StatelessWidget {
  const OrderTypeTextContainer({
    super.key,
    required this.text,
    required this.color,
  });
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .1),
      child: Row(
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: ShapeDecoration(
              color: color,
              shape: const OvalBorder(),
            ),
          ),
          SizedBox(width: Get.width * .02),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF555454),
              fontSize: 14,
              fontFamily: constant.font,
              fontWeight: FontWeight.w700,
              // height: 18.43,
            ),
          )
        ],
      ),
    );
  }
}
