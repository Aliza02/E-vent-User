import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/custom_theme.dart';
import 'pages.dart';
import 'routes.dart';
import 'bindings/all_controller_bindings.dart';

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
      getPages: Pages.getPages,
      //initialRoute: isViewed != null && isViewed != 0 ? NamedRoutes.onboard : NamedRoutes.login,
      initialRoute: isViewed != 0 ? NamedRoutes.onboard : NamedRoutes.login,
    );
  }
}
