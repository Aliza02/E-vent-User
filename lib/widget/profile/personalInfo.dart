import 'package:eventually_user/widget/profile/profileText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';

class personalInfo extends StatelessWidget {
  String textTitle;
  double fontSize;
  String icon;
  double height;
  personalInfo({
    super.key,
    required this.textTitle,
    required this.fontSize,
    required this.icon,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: Get.height * 0.015,
            left: Get.width * 0.07,
          ),
          child: SvgPicture.asset(icon, height: height),
        ),
        Container(
          margin: EdgeInsets.only(
            top: Get.height * 0.013,
            left: Get.width * 0.03,
          ),
          child: profileText(
            title: textTitle,
            fontSize: fontSize,
            fontWeight: AppFonts.medium,
            fontColor: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
