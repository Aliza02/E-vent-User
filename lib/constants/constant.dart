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
TextStyle k8TextStyle = const TextStyle(
  color: Colors.black,
  fontSize: 8,
  fontFamily: 'Manrope',
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

Color kSecondaryMessageColor = const Color(0xFFCB585A);
Color kSecondaryMessageColorLight = const Color.fromARGB(255, 214, 242, 255);
Color kOnlineColor = const Color.fromARGB(255, 209, 255, 210);
Color kPrimaryColor = const Color(0xFFCB585A);
Color kIconColor = const Color(0xFF292D32);
Color kdpColor = const Color(0x40CB585A);
Color kTextColor = const Color(0xFF555555);
Color kMsgContainerColor = const Color(0xFFE8E9EB);
Color kofferColor = const Color(0xff4285f4);
Color kWhiteColor = Colors.white;
Color kLightPrimaryColor = const Color.fromARGB(255, 245, 231, 231);
