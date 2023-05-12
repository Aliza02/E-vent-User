import 'package:eventually_user/screens/login.dart';
import 'package:eventually_user/screens/onboard.dart';
import 'package:eventually_user/screens/signup.dart';
import 'package:eventually_user/widget/textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/signup',
        routes: {
          '/onboard': (context) => onboard(),
          '/login': (context) => login(),
          '/signup': (context) => signup(),
        });
  }
}
