import 'package:eventually_user/controllers/message_controller.dart';
import 'package:eventually_user/routes.dart';
import 'package:eventually_user/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../controllers/drawercontroller.dart';

class bottomNavBar extends StatelessWidget {
  bottomNavBar({super.key});
  final pagecontroller = Get.put(drawerController());
  final msgController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.08,
          decoration: BoxDecoration(
            border: const Border(
              top: BorderSide(
                color: AppColors.pink,
                width: 2.0,
              ),
            ),
            gradient: LinearGradient(colors: [
              AppColors.white.withOpacity(0.1),
              AppColors.pink.withOpacity(0.2),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
        ),
        BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            width: Get.width,
            margin: EdgeInsets.only(top: Get.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    pagecontroller.changeIndex(0);
                    msgController.servicePriceOnChatOffer.clear();
                    msgController.chatUserId.clear();
                    print(msgController.chatUserId.length);
                    Get.offAllNamed(NamedRoutes.drawer);
                  },
                  icon: Obx(
                    () => pagecontroller.currentindex.value == 0
                        ? SvgPicture.asset(AppIcons.homeFill)
                        : SvgPicture.asset(AppIcons.home),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      pagecontroller.changeIndex(1);

                      // Get.offAllNamed(NamedRoutes.chatScreen);
                    },
                    icon: Obx(
                      () => pagecontroller.currentindex.value == 1
                          ? SvgPicture.asset(AppIcons.messageFill)
                          : SvgPicture.asset(AppIcons.message),
                    )),
                IconButton(
                    onPressed: () {
                      pagecontroller.changeIndex(2);
                      Get.to(() => profileScreen());
                    },
                    icon: Obx(
                      () => pagecontroller.currentindex.value == 2
                          ? SvgPicture.asset(AppIcons.settingFill)
                          : SvgPicture.asset(AppIcons.setting),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
