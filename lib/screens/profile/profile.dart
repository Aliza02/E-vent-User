import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/controllers/product_controller.dart';
import 'package:eventually_user/widget/profile/profileHeading.dart';
import 'package:eventually_user/widget/profile/profileText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../../firebaseMethods/userAuthentication.dart';
import '../../widget/profile/personalInfo.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  // final pagecontroller = Get.put(testController());
  final orderController = Get.put(OrderController());
  List<String> reviews = [];
  List<int> ratings = [];
  int colorindex = 0;
  int noOfOrder = 0;
  String phoneNo = '';
  String location = '';

  int part1 = 0;
  Future<void> getUserId() async {
    reviews.clear();
    noOfOrder = 0;

    await FirebaseFirestore.instance
        .collection('User')
        .doc(auth.currentUser!.uid)
        .get()
        .then((value) {
      phoneNo = value.data()!['Phone'];
      // location = value.data()!['location'];
    });

    await FirebaseFirestore.instance.collection('Orders').get().then((value) {
      value.docs.forEach((element) async {
        print(element.id);
        if (element.id.contains(auth.currentUser!.uid)) {
          orderController.userOrderDocId.value = element.id;
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('Orders')
        .doc(orderController.userOrderDocId.value)
        .collection('bookings')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        noOfOrder++;
        reviews.add(element.data()['review']);
        print(noOfOrder);
        if (element.data()['rating'].toString().contains('.')) {
          List<String> parts = element.data()['rating'].toString().split('.');
          part1 = int.parse(parts[0]);
        }
        ratings.add(part1);
      });
    });
  }

  Widget pagesOnProfile(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // List<String> options = ['Settings', 'Switch Account', 'Logout'];
    // final firebasecontroller = Get.put(firebaseController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBar.withOpacity(0.3),
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.editPersonalInfo),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Stack(
              children: [
                Container(
                  height: Get.height * 0.1,
                  decoration: BoxDecoration(
                    color: AppColors.appBar.withOpacity(0.2),
                  ),
                ),
                FutureBuilder(
                    future: getUserId(),
                    builder: (context, snapshot) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(
                              left: Get.width * 0.09,
                              // top: Get.height * 0.04,
                            ),
                            child: const heading(title: 'Profile'),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: Get.height * 0.01,
                                  left: Get.width * 0.07,
                                ),
                                padding: EdgeInsets.all(Get.width * 0.01),
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.grey.withOpacity(0.2),
                                  backgroundImage: const AssetImage(
                                      'assets/images/profileimage.png'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: Get.width * 0.01),
                                child: profileText(
                                  title:
                                      auth.currentUser!.displayName.toString(),
                                  fontColor: AppColors.grey.withOpacity(0.5),
                                  fontSize: Get.width * 0.04,
                                  fontWeight: AppFonts.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: Get.height * 0.02,
                                      left: Get.width * 0.07,
                                    ),
                                    child: profileText(
                                      title: 'Personal Information',
                                      fontSize: Get.width * 0.05,
                                      fontWeight: AppFonts.extraBold,
                                      fontColor: AppColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              // InkWell(
                              //   onTap: () {
                              //     Get.toNamed('/editprofile');
                              //   },
                              //   child: Container(
                              //     margin: EdgeInsets.only(
                              //         top: Get.height * 0.02,
                              //         right: Get.width * 0.04),
                              //     child: SvgPicture.asset(
                              //         AppIcons.editPersonalInfo),
                              //   ),
                              // ),
                            ],
                          ),

                          // Obx(
                          //   () =>
                          personalInfo(
                            textTitle: auth.currentUser!.displayName.toString(),
                            fontSize: Get.width * 0.04,
                            icon: AppIcons.profileName,
                            height: Get.height * 0.02,
                          ),
                          // ),

                          personalInfo(
                            textTitle: phoneNo,
                            fontSize: Get.width * 0.04,
                            icon: AppIcons.profilePhone,
                            height: Get.height * 0.02,
                          ),

                          // Obx(
                          //   () =>
                          // personalInfo(
                          //   textTitle: location,
                          //   fontSize: Get.width * 0.04,
                          //   icon: AppIcons.profileLocation,
                          //   height: Get.height * 0.02,
                          // ),
                          // ),

                          Divider(
                            color: AppColors.pink.withOpacity(0.6),
                            height: 20.0,
                          ),

                          // congrats section
                          SizedBox(height: Get.height * 0.01),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                    left: Get.width * 0.02,
                                  ),
                                  child: Image.asset(
                                    'assets/images/trophy.png',
                                    height: Get.height * 0.1,
                                    width: Get.width * 0.3,
                                  )),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Obx(
                                    //   () =>
                                    profileText(
                                      title:
                                          "Congrats ${auth.currentUser!.displayName.toString()}",
                                      fontSize: Get.width * 0.055,
                                      fontWeight: AppFonts.extraBold,
                                      fontColor: AppColors.grey,
                                    ),
                                    // ),
                                    FutureBuilder(
                                        future: getUserId(),
                                        builder: (context, snapshot) {
                                          return RichText(
                                            text: TextSpan(
                                              text: "You've booked ",
                                              style: TextStyle(
                                                fontFamily: AppFonts.manrope,
                                                fontWeight: AppFonts.medium,
                                                fontSize: Get.width * 0.035,
                                                color: AppColors.grey,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: noOfOrder.toString(),
                                                  style: TextStyle(
                                                    fontFamily:
                                                        AppFonts.manrope,
                                                    fontWeight: AppFonts.bold,
                                                    fontSize: Get.width * 0.05,
                                                    color: AppColors.grey,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      ' Orders from EventuAlly.',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        AppFonts.manrope,
                                                    fontWeight: AppFonts.medium,
                                                    fontSize: Get.width * 0.035,
                                                    color: AppColors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                    profileText(
                                      title: "Keep Going!.",
                                      fontSize: Get.width * 0.035,
                                      fontWeight: AppFonts.medium,
                                      fontColor: AppColors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
