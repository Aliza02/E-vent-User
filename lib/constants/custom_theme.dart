import 'package:flutter/material.dart';

import 'constant.dart';

class CustomTheme {
  static ThemeData? theme = ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
            Color(constant.red)), // Set the text color of the buttons
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      // dialTextColor: Color(constant.red),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(constant.red), // Set the color of the input border
            width: 1.0, // Set the width of the input border
          ),
          borderRadius: BorderRadius.circular(8), // Set the border radius
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(
                constant.red), // Set the color of the focused input border
            width: 1.0, // Set the width of the focused input border
          ),
          borderRadius: BorderRadius.circular(8), // Set the border radius
        ),
      ),

      dialHandColor: Color(constant.red),
      backgroundColor: Color(constant.white),
      dialBackgroundColor: Color(constant.white),
      dayPeriodColor: Colors.white,
      dayPeriodTextColor: Color(constant.black),
      cancelButtonStyle: TextButton.styleFrom(
        primary: Colors.white, // Set the text color of the cancel button
        backgroundColor: Color(
            constant.red), // Set the background color of the cancel button
      ),
      confirmButtonStyle: TextButton.styleFrom(
        primary:
            Color(constant.red), // Set the text color of the confirm button
        backgroundColor: Color(
            constant.red), // Set the background color of the confirm button
      ),
      hourMinuteColor: Colors.white,
      hourMinuteTextColor: Color(constant.black),
      hourMinuteTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
    ),
    // colorScheme: ColorScheme(
    //   primary: Color(0xFFCB585A),
    //   onPrimary: Colors.white,
    //   secondary: Color(0xFF555555),
    //   onSecondary: Colors.black,
    //   surface: Colors.white,
    //   onSurface: Colors.black,
    //   background: Color(0xFFFAFAFA),
    //   onBackground: Colors.black,
    //   brightness: Brightness.light,
    //   error: Color(0xFFCB585A),
    //   onError: Colors.white,
    // ),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Color(constant.black),
      ),
      iconTheme: IconThemeData(color: Color(constant.black), size: 30),
      elevation: 0,
    ),
  );
}
