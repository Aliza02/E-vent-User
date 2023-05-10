import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

class logo extends StatelessWidget {
  double width;
  double height;

  logo({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: 100.0,
      height: 100.0,
      "assets/images/logo.png",
    );
  }
}
