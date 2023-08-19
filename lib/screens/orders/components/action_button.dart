import 'package:flutter/material.dart';
// import 'package:get/get.dart';

import '../../../constants/constant.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.text,
  });
  final VoidCallback onTap;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 33,
      width: 135,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        shadows: shadowsAbove,
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Color(constant.white),
              fontSize: 12,
              fontFamily: constant.font,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
