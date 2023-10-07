import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';

class OrderLocation extends StatelessWidget {
  final String location;
  const OrderLocation({
    super.key,
    required this.location,
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
              color: Color(constant.lightGrey),
              fontSize: 14,
              fontFamily: constant.font,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          // width: 258,
          child: Text(
            location,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
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
