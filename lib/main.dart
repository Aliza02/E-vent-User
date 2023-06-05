import 'package:eventually_user/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/login.dart';
import '../screens/onboard.dart';
import '../screens/otp_verification.dart';
import '../screens/signup.dart';
import '../widget/textfield.dart';
import 'bindings/allControllerBindings.dart';
import 'screens/forget_pasword/forget_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Color(0xFFCB585A),
          onPrimary: Colors.white,
          secondary: Color(0xFF555555),
          onSecondary: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
          background: Color(0xFFFAFAFA),
          onBackground: Colors.black,
          brightness: Brightness.light,
          error: Color(0xFFCB585A),
          onError: Colors.white,
        ),
        appBarTheme: AppBarTheme(
            color: Colors.transparent,
            titleTextStyle: TextStyle(
              color: Color(constant.black),
            ),
            iconTheme: IconThemeData(color: Color(constant.black), size: 30),
            elevation: 0),
      ),
      initialBinding: AllControllerBinding(),
      getPages: [
        GetPage(name: '/onboard', page: () => const Onboard()),
        GetPage(name: '/login', page: () => const Login()),
        GetPage(name: '/signup', page: () => const signup()),
        GetPage(name: '/otpverification', page: () => const OtpVerification()),
        GetPage(name: '/forgetpassword', page: () => const ForgetPassword()),
      ],
      initialRoute: '/login',
      // routes: {
      //   '/onboard': (context) => onboard(),
      //   '/login': (context) => login(),
      //   '/signup': (context) => signup(),
      //   '/otpverification': (context) => otp_verification(),
      // },
    );
  }
}
