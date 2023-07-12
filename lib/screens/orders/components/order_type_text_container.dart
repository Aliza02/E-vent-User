import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            style: const TextStyle(
              color: Color(0xFF555454),
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
              // height: 18.43,
            ),
          )
        ],
      ),
    );
  }
}
