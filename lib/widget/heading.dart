import 'package:flutter/material.dart';

import '../constants/constant.dart';

// ignore: must_be_immutable
class Heading extends StatefulWidget {
  double heightFromTop;
  double fontSize;
  String title;
  Heading(
      {super.key,
      required this.title,
      required this.heightFromTop,
      required this.fontSize});

  @override
  State<Heading> createState() => _HeadingState();
}

class _HeadingState extends State<Heading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, widget.heightFromTop, 0.0, 0.0),
      child: Text(
        widget.title,
        style: TextStyle(
          color: Colors.black,
          fontFamily: constant.font,
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
