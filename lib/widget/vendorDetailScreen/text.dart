import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class text extends StatelessWidget {
  final String label;
  const text({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontFamily: constant.font,
        fontWeight: AppFonts.bold,
        fontSize: Get.width * 0.045,
      ),
    );
  }
}
