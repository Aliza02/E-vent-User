import 'package:eventually_user/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login.dart';
import '../screens/home_page/home_page.dart';
import 'screens/orders/orders_screen.dart';
import 'screens/order_status/order_status_screen.dart';
import '../screens/onboard.dart';
import '../screens/otp_verification.dart';
import '../screens/signup.dart';
import 'bindings/all_controller_bindings.dart';
import 'screens/forget_pasword/forget_password_screen.dart';

int? isViewed;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  isViewed = prefs.getInt('onboard');
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
            elevation: 0),
      ),
      initialBinding: AllControllerBinding(),
      getPages: [
        GetPage(name: '/onboard', page: () => const Onboard()),
        GetPage(name: '/login', page: () => const Login()),
        GetPage(name: '/signup', page: () => const signup()),
        GetPage(name: '/otpverification', page: () => const OtpVerification()),
        GetPage(name: '/forgetpassword', page: () => const ForgetPassword()),
        GetPage(name: '/homepage', page: () => const HomePage()),
        GetPage(name: '/order', page: () => OrdersScreen()),
        GetPage(name: '/orderstatus', page: () => OrderStatusScreen()),
      ],
      initialRoute: isViewed != 0 ? '/onboard' : '/login',
      // routes: {
      //   '/onboard': (context) => onboard(),
      //   '/login': (context) => login(),
      //   '/signup': (context) => signup(),
      //   '/otpverification': (context) => otp_verification(),
      // },
    );
  }
}
