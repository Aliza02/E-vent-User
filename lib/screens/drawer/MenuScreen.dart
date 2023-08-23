import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../../controllers/drawercontroller.dart';
import '../../firebasemethods/userAuthentication.dart';
import '../../routes.dart';
import '../orders/orders_screen.dart';
import '../setting/settings.dart';

class MenuScreen extends GetView<drawerController> {
  MenuScreen({super.key});
  final pagecontroller = Get.put(drawerController());
  int currentindex = 0;

  final FirebaseAuth auth = FirebaseAuth.instance;

  final List<String> menuItems = [
    'Orders',
    'Payment',
    'Tell a Friend',
    'Settings',
    'Profile',
    'Help Center'
  ];

  final List<String> menuIcons = [
    AppIcons.order,
    AppIcons.payment,
    AppIcons.share,
    AppIcons.setting,
    AppIcons.Profile,
    AppIcons.helpCenter,
  ];

  final List<String> menuIconsFilled = [
    AppIcons.orderFill,
    AppIcons.paymentFill,
    AppIcons.shareFill,
    AppIcons.settingFill,
    AppIcons.ProfileFill,
    AppIcons.helpCenterFill,
  ];

  // final List<Widget> menuPages = [
  //   OrdersScreen(),

  //   Settings(),

  // ];

  Widget buildMenuItems(BuildContext context, int index) {
    return Obx(
      () => Container(
        width: Get.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: pagecontroller.indexOfDrawerMenuItems.value == index
                ? AppColors.pink.withOpacity(0.2)
                : Colors.transparent),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: Get.width * 0.06,
                vertical: Get.width * 0.03,
              ),
              child: pagecontroller.indexOfDrawerMenuItems.value == index
                  ? SvgPicture.asset(menuIconsFilled[index])
                  : SvgPicture.asset(menuIcons[index]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
              child: Text(
                menuItems[index],
                style: TextStyle(
                  color: pagecontroller.indexOfDrawerMenuItems.value == index
                      ? AppColors.pink
                      : AppColors.grey,
                  fontWeight: AppFonts.medium,
                  fontSize: Get.width * 0.034,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cream,
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: Get.height * 0.05),
                  width: Get.height / 8,
                  height: Get.height * 0.12,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.pink.withOpacity(0.6),
                        spreadRadius: 12,
                        blurRadius: 18.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Get.height * 0.05),
                  padding: EdgeInsets.all(Get.width * 0.01),
                  child: const CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage('assets/images/profileimage.png'),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: Get.height * 0.02),
              child: Text(
                auth.currentUser!.displayName!.toString(),
                style: TextStyle(
                  fontFamily: AppFonts.manrope,
                  fontWeight: AppFonts.extraBold,
                  fontSize: Get.width * 0.05,
                  color: AppColors.grey,
                ),
              ),
            ),
            Text(
              auth.currentUser!.email.toString(),
              style: TextStyle(
                fontSize: Get.width * 0.035,
                fontFamily: AppFonts.manrope,
                fontWeight: AppFonts.medium,
                color: AppColors.grey,
              ),
            ),
            Divider(
              color: AppColors.grey.withOpacity(0.12),
              height: 20.0,
              thickness: 2.0,
            ),
            Column(
              children: List.generate(
                menuItems.length,
                (index) => GestureDetector(
                  onTap: () {
                    pagecontroller.indexOfDrawerMenuItems.value = index;
                  },
                  child: buildMenuItems(context, index),
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Signout();
                Get.toNamed(NamedRoutes.login);
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.06,
                        vertical: Get.width * 0.07),
                    child: SvgPicture.asset(AppIcons.logout),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.06,
                        vertical: Get.width * 0.07),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: AppColors.pink,
                        fontSize: Get.width * 0.04,
                        fontWeight: AppFonts.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
