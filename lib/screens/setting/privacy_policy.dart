import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class privacyPolicy extends StatelessWidget {
  const privacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBar.withOpacity(0.3),
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Stack(
          children: [
            Container(
              height: Get.height * 0.14,
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.appBar.withOpacity(0.3),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: Get.width * 0.1),
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                    color: AppColors.pink,
                    fontSize: Get.width * 0.07,
                    fontFamily: AppFonts.manrope,
                    fontWeight: AppFonts.bold),
              ),
            ),
            // Center(
            //   child: Container(
            //     width: Get.width,
            //     decoration: BoxDecoration(
            //       color: AppColors.white,
            //     ),
            //     // child: ListView.builder(
            //     //   itemCount: 4,
            //     //   itemBuilder: (context, index) {
            //     //     return Text('sda');
            //     //   },
            //     // ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
