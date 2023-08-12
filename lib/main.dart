import 'package:eventually_user/screens/location/locations.dart';
import 'package:eventually_user/screens/setting/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login.dart';
import '../screens/home_page/home_page.dart';
import 'constants/custom_theme.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/chat/home_screen.dart';
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
import 'screens/setting/settings.dart';
import 'screens/location/locations.dart';

int? isViewed;
void main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
      theme: CustomTheme.theme,
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
        GetPage(name: '/chat_screen', page: () => const ChatHomeScreen()),
        GetPage(name: '/settings', page:()=> const Settings()),
        GetPage(name: '/locations', page:()=> const Locations()),
      ],
      //initialRoute: isViewed != null && isViewed != 0 ? '/onboard' : '/login',
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
