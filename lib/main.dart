import 'package:eventually_user/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login.dart';
import '../screens/home_page/home_page.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/checkout/checkout_screen.dart';
import 'screens/confirmation/confirmation_screen.dart';
import 'screens/order_placed/order_placed_screen.dart';
import 'screens/orders/orders_screen.dart';
import 'screens/order_status/order_status_screen.dart';
import '../screens/onboard.dart';
import '../screens/otp_verification.dart';
import '../screens/signup.dart';
import 'bindings/all_controller_bindings.dart';
import 'screens/forget_pasword/forget_password_screen.dart';
import 'screens/product/product_screen.dart';

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
      ),
      initialBinding: AllControllerBinding(),
      getPages: [
        GetPage(name: '/onboard', page: () => const Onboard()),
        GetPage(name: '/login', page: () => const Login()),
        GetPage(name: '/signup', page: () => const Signup()),
        GetPage(name: '/otpverification', page: () => const OtpVerification()),
        GetPage(name: '/forgetpassword', page: () => const ForgetPassword()),
        GetPage(name: '/homepage', page: () => const HomePage()),
        GetPage(name: '/order', page: () => OrdersScreen()),
        GetPage(name: '/orderstatus', page: () => OrderStatusScreen()),
        GetPage(name: '/product', page: () => const ProductScreen()),
        GetPage(name: '/mycart', page: () => CartScreen()),
        GetPage(name: '/order_placed', page: () => const OrderPlacedScreen()),
        GetPage(
            name: '/order_confirmation',
            page: () => const ConfirmationScreen()),
        GetPage(name: '/checkout', page: () => const CheckOutScreen()),
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
