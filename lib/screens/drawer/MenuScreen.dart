import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/controllers/order_btn_controller.dart';
import 'package:eventually_user/controllers/place_order_controller.dart';
import 'package:eventually_user/screens/Help_center/help.dart';
import 'package:eventually_user/screens/drawer/drawerScreen.dart';
import 'package:eventually_user/screens/home_page/home_page.dart';
import 'package:eventually_user/screens/payment/payment_methods.dart';
import 'package:eventually_user/screens/profile/profile.dart';
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
import 'package:eventually_user/screens/setting/settings.dart';

class MenuScreen extends GetView<drawerController> {
  MenuScreen({super.key});
  final pagecontroller = Get.put(drawerController());
  final orderBtnController = Get.put(OrdersBtnController());
  final placeorderController = Get.put(placeOrderController());
  int currentindex = 0;
  final FirebaseAuth auth = FirebaseAuth.instance;

  final List<String> menuItems = [
    'Home',
    'Orders',
    // 'Payment',
    // 'Tell a Friend',
    'Settings',
    'Profile',
    'Help Center'
  ];

  final List<String> menuIcons = [
    AppIcons.home,
    AppIcons.order,
    // AppIcons.payment,
    // AppIcons.share,
    AppIcons.setting,
    AppIcons.Profile,
    AppIcons.helpCenter,
  ];

  final List<String> menuIconsFilled = [
    AppIcons.homeFill,
    AppIcons.orderFill,
    // AppIcons.paymentFill,
    // AppIcons.shareFill,
    AppIcons.settingFill,
    AppIcons.ProfileFill,
    AppIcons.helpCenterFill,
  ];

  final List<Widget> _drawerPages = [
    drawerScreen(),
    OrdersScreen(),
    // PaymentMethods(),
    settings(),
    profileScreen(),
    Help(),
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
                    placeorderController.enableCancelOrderButton.value = true;
                    Get.to(() => _drawerPages[index]);
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
