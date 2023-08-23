import 'package:eventually_user/screens/drawer/drawerScreen.dart';
import 'package:get/get.dart';

import 'routes.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/chat/home_screen.dart';
import 'screens/checkout/checkout_screen.dart';
import 'screens/confirmation/confirmation_screen.dart';
import 'screens/forget_pasword/forget_password_screen.dart';
import 'screens/home_page/home_page.dart';
import 'screens/location/locations.dart';
import 'screens/login.dart';
import 'screens/onboard.dart';
import 'screens/order_placed/order_placed_screen.dart';
import 'screens/order_status/order_status_screen.dart';
import 'screens/order_status/review_screen.dart';
import 'screens/order_status/verified_order_screen.dart';
import 'screens/order_status/verify_order.dart';
import 'screens/orders/order_cancellation.dart';
import 'screens/orders/order_feedback.dart';
import 'screens/orders/orders_screen.dart';
import 'screens/otp_verification.dart';
import 'screens/product/product_screen.dart';
import 'screens/setting/settings.dart';
import 'screens/signup.dart';

class Pages {
  Pages._();
  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: NamedRoutes.onboard, page: () => const Onboard()),
    GetPage(name: NamedRoutes.login, page: () => const Login()),
    GetPage(name: NamedRoutes.signup, page: () => const Signup()),
    GetPage(
        name: NamedRoutes.otpVerification, page: () => const OtpVerification()),
    GetPage(
        name: NamedRoutes.forgetpassword, page: () => const ForgetPassword()),
    GetPage(name: NamedRoutes.homepage, page: () => const HomePage()),
    GetPage(name: NamedRoutes.order, page: () => OrdersScreen()),
    GetPage(name: NamedRoutes.orderStatus, page: () => OrderStatusScreen()),
    GetPage(name: NamedRoutes.product, page: () => const ProductScreen()),
    GetPage(name: NamedRoutes.myCart, page: () => CartScreen()),
    GetPage(
        name: NamedRoutes.orderPlaced, page: () => const OrderPlacedScreen()),
    GetPage(
        name: NamedRoutes.orderConfirmation,
        page: () => const ConfirmationScreen()),
    GetPage(name: NamedRoutes.checkout, page: () => const CheckOutScreen()),
    GetPage(name: NamedRoutes.chatScreen, page: () => const ChatHomeScreen()),
    GetPage(
        name: NamedRoutes.orderCancellation, page: () => OrderCancellation()),
    GetPage(name: NamedRoutes.orderFeedBack, page: () => OrderFeedBack()),
    GetPage(name: NamedRoutes.verifyOrder, page: () => VerifyOrderScreen()),
    GetPage(name: NamedRoutes.verifiedOrder, page: () => VerifiedOrderScreen()),
    GetPage(name: NamedRoutes.review, page: () => ReviewScreen()),
    GetPage(name: NamedRoutes.settings, page: () => const Settings()),
    GetPage(name: NamedRoutes.locations, page: () => const Locations()),
    GetPage(name: NamedRoutes.drawer, page: () => drawerScreen()),
  ];
}
