import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/constants/font.dart';
import 'package:eventually_user/routes.dart';
import 'package:eventually_user/screens/Help_center/FAQs.dart';
import 'package:eventually_user/screens/setting/privacy_policy.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../firebasemethods/userAuthentication.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: const Text('Settings'),
          centerTitle: true,
        ),
        body: SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
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
                      Text(
                        auth.currentUser!.displayName!.toString(),
                        style: TextStyle(
                          fontFamily: AppFonts.manrope,
                          fontWeight: AppFonts.extraBold,
                          fontSize: Get.width * 0.05,
                          color: AppColors.grey,
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
                    ],
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 50, // Space above the line
                    thickness: 0.2, // Line thickness
                    indent: 20, // Space before the line starts
                    endIndent: 20, // Space after the line ends
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(NamedRoutes.profile);
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Row(children: [
                        ImageIcon(AssetImage('assets/images/Vector.png')),
                        // Image(image: AssetImage('images/Vector.jpg'),),
                        // Icon(Icons.key),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Account")
                      ]),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 50, // Space above the line
                    thickness: 0.2, // Line thickness
                    indent: 20, // Space before the line starts
                    endIndent: 20, // Space after the line ends
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Row(children: [
                      ImageIcon(AssetImage('assets/images/notification.png')),
                      // Icon(Icons.notifications),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Notificatoin")
                    ]),
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 50, // Space above the line
                    thickness: 0.2, // Line thickness
                    indent: 20, // Space before the line starts
                    endIndent: 20, // Space after the line ends
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => privacyPolicy(),
                        transition: Transition.leftToRightWithFade,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Row(children: [
                        ImageIcon(AssetImage('assets/images/Group.png')),
                        // Icon(Icons.lock),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Privacy Policy")
                      ]),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 50, // Space above the line
                    thickness: 0.2, // Line thickness
                    indent: 20, // Space before the line starts
                    endIndent: 20, // Space after the line ends
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => FAQs());
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: const Row(children: [
                        ImageIcon(AssetImage('assets/images/faq.png')),
                        // Icon(Icons.format_quote),
                        SizedBox(
                          width: 10,
                        ),
                        Text("FAQ's")
                      ]),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 50, // Space above the line
                    thickness: 0.2, // Line thickness
                    indent: 20, // Space before the line starts
                    endIndent: 20, // Space after the line ends
                  ),
                  // Container(
                  //   margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  //   child: Row(children: [
                  //     ImageIcon(AssetImage('assets/images/location.png')),
                  //     // Icon(Icons.location_city),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Text("Location")
                  //   ]),
                  // ),
                  // const Divider(
                  //   color: Colors.black,
                  //   height: 50, // Space above the line
                  //   thickness: 0.2, // Line thickness
                  //   indent: 20, // Space before the line starts
                  //   endIndent: 20, // Space after the line ends
                  // ),
                ]),
          ),
        ),
      ),
    );
  }
}
