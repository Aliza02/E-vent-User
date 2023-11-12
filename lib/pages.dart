import 'package:eventually_user/screens/Help_center/FAQs.dart';
import 'package:eventually_user/screens/Help_center/complaint.dart';
import 'package:eventually_user/screens/drawer/drawerScreen.dart';
import 'package:eventually_user/screens/home_page/search_screen.dart';
import 'package:eventually_user/screens/setting/privacy_policy.dart';
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
    GetPage(
      name: NamedRoutes.onboard,
      page: () => const Onboard(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.login,
      page: () => const Login(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.signup,
      page: () => const Signup(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.otpVerification,
      page: () => const OtpVerification(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.forgetpassword,
      page: () => const ForgetPassword(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.homepage,
      page: () => const HomePage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.order,
      page: () => OrdersScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.orderStatus,
      page: () => OrderStatusScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.product,
      page: () => const ProductScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.myCart,
      page: () => CartScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.orderPlaced,
      page: () => const OrderPlacedScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.orderConfirmation,
      page: () => ConfirmationScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.checkout,
      page: () => CheckOutScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.chatScreen,
      page: () => const ChatHomeScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.orderCancellation,
      page: () => OrderCancellation(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.orderFeedBack,
      page: () => OrderFeedBack(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.verifyOrder,
      page: () => VerifyOrderScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.verifiedOrder,
      page: () => VerifiedOrderScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.review,
      page: () => ReviewScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.settings,
      page: () => const settings(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.locations,
      page: () => const Locations(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.drawer,
      page: () => drawerScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.profile,
      page: () => drawerScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.faq,
      page: () => FAQs(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: NamedRoutes.complaint,
      page: () => Complaint(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
     GetPage(
      name: NamedRoutes.complaint,
      page: () => privacyPolicy(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    // GetPage(name: NamedRoutes.vendorScreen, page: () => VendorDetailsScreen(restaurant: ,)),
  ];
}
