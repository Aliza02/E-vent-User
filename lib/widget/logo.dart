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
      width: this.width * 0.9,
      height: this.height * 0.15,
      "assets/images/logo.png",
    );
  }
}
