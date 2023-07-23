import 'package:flutter/material.dart';

class Constant {
  var font = 'Manrope';
  var onboardingFont = 'signika';
  int red = 0xFFCB585A;
  int blue = 0xff4285f4;
  int black = 0xFF000000;
  int white = 0xFFFFFFFF;
  int lightPink = 0x40CB585A;
  int icon = 0xFF292D32;
  // int background = 0xFFFAFAFA;

  int grey = 0xFF555555;
  int lightGreen = 0xFF43FD6C;

  // page indicator colors:
  List<int> pageIndicator = [0xFFBBDEFF, 0xFFFFD4A1, 0xFFC6F988];
}

Constant constant = Constant();

TextStyle kBlackTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontFamily: constant.font,
  fontWeight: FontWeight.w800,
);
TextStyle kRedTextStyle = TextStyle(
  color: Color(constant.red),
  fontSize: 16,
  fontFamily: constant.font,
  fontWeight: FontWeight.w800,
);
TextStyle k8TextStyle = TextStyle(
  color: Colors.black,
  fontSize: 8,
  fontFamily: constant.font,
  fontWeight: FontWeight.w600,
);
List<BoxShadow>? shadowsBelow = [
  const BoxShadow(
    color: Color(0x0C1C252C),
    blurRadius: 8,
    offset: Offset(0, 4),
    spreadRadius: 0,
  )
];
List<BoxShadow>? shadowsAbove = [
  const BoxShadow(
    color: Color(0x26000000),
    blurRadius: 15,
    offset: Offset(0, 4),
    spreadRadius: 0,
  )
];

// Color kSecndaryMessageColorLight = const Color.fromARGB(255, 214, 242, 255);
