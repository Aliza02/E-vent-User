import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';

class FeedBackField extends StatelessWidget {
  const FeedBackField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width * .75,
          height: Get.height * .25,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadows: shadowsAll,
          ),
          child: Text(
            'Write feedback...',
            style: TextStyle(
              color: Color(constant.fieldTextHint),
              fontSize: 16,
              fontFamily: constant.font,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: InkWell(
            child: SvgPicture.asset('assets/icons/feedback.svg'),
            onTap: () {},
          ),
        )
      ],
    );
  }
}
