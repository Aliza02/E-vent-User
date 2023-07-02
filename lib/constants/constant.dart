import 'package:flutter/material.dart';

class Constant {
  var font = 'Manrope';
  var onboardingFont = 'signika';
  int red = 0xFFCB585A;
  int black = 0xFF000000;
  int white = 0xFFFFFFFF;
  // int background = 0xFFFAFAFA;
  int grey = 0xFF555555;

  // page indicator colors:
  List<int> pageIndicator = [0xFFBBDEFF, 0xFFFFD4A1, 0xFFC6F988];
}

Constant constant = Constant();

TextStyle kBlackTextStyle = const TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontFamily: 'Manrope',
  fontWeight: FontWeight.w800,
);
TextStyle kRedTextStyle = TextStyle(
  color: Color(constant.red),
  fontSize: 16,
  fontFamily: 'Manrope',
  fontWeight: FontWeight.w800,
);
