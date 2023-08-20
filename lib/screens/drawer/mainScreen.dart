import 'package:eventually_user/screens/chat/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/constant.dart';
import '../../controllers/drawercontroller.dart';
import '../../routes.dart';
import '../../widget/BottomNavBar/bottomNavBar.dart';
import '../home_page/home_page.dart';
import '../setting/settings.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    super.key,
  });

  final pagecontroller = Get.put(drawerController());

  final List<Widget> _pages = [
    HomePage(),
    ChatHomeScreen(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    // List<String> options = ['Settings', 'Switch Account', 'Logout'];
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNavBar(),
        appBar: AppBar(
          // backgroundColor: AppColors.appBar.withOpacity(0.2),
          shadowColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              ZoomDrawer.of(context)?.toggle();
            },
            child: Icon(
              Icons.menu,
              color: Constant.pink,
              size: Get.width * 0.1,
              weight: Get.width * 0.1,
            ),
          ),

          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(NamedRoutes.order);
              },
              icon: const Icon(
                Icons.notifications,
                color: Color(0xFFCB585A),
              ),
            ),
          ],
          // actions: [
          //   pagecontroller.currentindex.value == 4
          //       ? PopupMenuButton(
          //           icon: SvgPicture.asset(AppIcons.profileMenuIcon),
          //           color: AppColors.cream,
          //           itemBuilder: (BuildContext context) {
          //             return options.map((String option) {
          //               return PopupMenuItem(
          //                 onTap: () {
          //                   print(options.indexOf(option));
          //                 },
          //                 child: Text(option),
          //               );
          //             }).toList();
          //           },
          //         )
          //       : Container(),
          // ],
        ),
        body: Obx(
          () => _pages[pagecontroller.currentindex.value],
        ),
      ),
    );
  }
}
