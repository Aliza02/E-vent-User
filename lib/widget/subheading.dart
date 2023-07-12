import 'package:flutter/material.dart';

import '../constants/constant.dart';

// ignore: must_be_immutable
class SubHeading extends StatefulWidget {
  String title;
  double fontSize;
  SubHeading({super.key, required this.title, required this.fontSize});

  @override
  State<SubHeading> createState() => _SubHeadingState();
}

class _SubHeadingState extends State<SubHeading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.title,
        textAlign: TextAlign.center,
        maxLines: 2,
        softWrap: true,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontFamily: constant.font,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF555555),
          fontSize: widget.fontSize,
        ),
      ),
    );
  }
}
