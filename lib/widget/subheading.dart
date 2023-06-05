import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/constant.dart';

class subHeading extends StatefulWidget {
  String title;
  double fontSize;
  subHeading({super.key, required this.title, required this.fontSize});

  @override
  State<subHeading> createState() => _subHeadingState();
}

class _subHeadingState extends State<subHeading> {
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
          color: Color(0xFF555555),
          fontSize: widget.fontSize,
        ),
      ),
    );
  }
}
