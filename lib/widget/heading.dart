import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/constant.dart';

class heading extends StatefulWidget {
  double heightFromTop;
  double fontSize;
  String title;
  heading(
      {super.key,
      required this.title,
      required this.heightFromTop,
      required this.fontSize});

  @override
  State<heading> createState() => _headingState();
}

class _headingState extends State<heading> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
