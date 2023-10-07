import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class heading extends StatelessWidget {
  final String title;

  const heading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.pink,
        fontSize: Get.width * 0.065,
        fontFamily: AppFonts.manrope,
        fontWeight: AppFonts.extraBold,
      ),
    );
  }
}
