import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'constants/custom_theme.dart';
import 'pages.dart';
import 'routes.dart';
import 'bindings/all_controller_bindings.dart';

int? isViewed;
bool? isLoggedin;
void main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  isViewed = prefs.getInt('onboard');
  isLoggedin = prefs.getBool('rememberMe');
  Stripe.publishableKey =
      "pk_test_51No9dKEputI98S5Hwvm0RkqB0qYtXPE3HgWEFX4wNfyP6V9BH9uWmOvKk6bo0Y0Ssfb9PQfHWBhJmU3jpueCUOMJ00rLqXT9CY";
  await dotenv.load(fileName: "assets/.env");
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
      getPages: Pages.getPages,
      // initialRoute: isViewed != null && isViewed != 0 ? NamedRoutes.onboard : NamedRoutes.login,
      initialRoute: isViewed != 0
          ? NamedRoutes.onboard
          : isLoggedin == true
              ? NamedRoutes.drawer
              : NamedRoutes.login,
      // initialRoute: NamedRoutes.privacyPolicy,
    );
  }
}
