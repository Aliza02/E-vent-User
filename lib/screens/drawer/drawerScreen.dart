import 'package:eventually_user/constants/constant.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import 'MenuScreen.dart';
import 'mainScreen.dart';

class drawerScreen extends StatefulWidget {
  const drawerScreen({super.key});

  @override
  State<drawerScreen> createState() => _drawerScreenState();
}

class _drawerScreenState extends State<drawerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZoomDrawer(
        mainScreen: MainScreen(),
        menuScreen: MenuScreen(),
        menuBackgroundColor: Constant.pink,
        showShadow: true,
        style: DrawerStyle.defaultStyle,
        angle: 0.0,
        slideWidth: Get.width * .65,
      ),
    );
  }
}
