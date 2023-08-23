import 'package:flutter/material.dart';

class Constant {
  static Color pink = Color(0xFFCB585A);
  var font = 'Manrope';
  var onboardingFont = 'signika';
  int red = 0xFFCB585A;
  int lightRed = 0xFFEA4335;
  int blue = 0xff4285f4;
  int black = 0xFF000000;
  int white = 0xFFFFFFFF;
  int lightPink = 0x40CB585A;
  int icon = 0xFF292D32;
  int green = 0xFF34A853;
  int fieldTextHint = 0xAF555454;

  // int background = 0xFFFAFAFA;

  int grey = 0xFF555555;
  int lightGrey = 0xFF555454;
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
List<BoxShadow>? shadowsAll = [
  const BoxShadow(
    color: Color(0x26555454),
    blurRadius: 16,
    offset: Offset(0, 4),
    spreadRadius: 0,
  )
];

// Color kSecndaryMessageColorLight = const Color.fromARGB(255, 214, 242, 255);
