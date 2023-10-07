import 'package:eventually_user/constants/font.dart';
import 'package:flutter/material.dart';

class profileText extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  const profileText(
      {super.key,
      required this.title,
      required this.fontSize,
      required this.fontWeight,
      required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: AppFonts.manrope,
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
