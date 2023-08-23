import 'package:eventually_user/screens/home_page/home_page.dart';
import 'package:eventually_user/widget/button.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';
import '../../routes.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TextAppBar(title: ''),
      // bottomNavigationBar: const CustomBottomNabBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/order_placed.png',
                width: Get.width * .9,
              ),
              SizedBox(height: Get.height * .01),
              Text(
                'Congratulations!',
                style: TextStyle(
                  color: Color(constant.red),
                  fontSize: 24,
                  fontFamily: constant.font,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: Get.height * .01),
              Text(
                'Your order number is : 123456',
                style: TextStyle(
                  color: Color(constant.lightGrey),
                  fontSize: 18,
                  fontFamily: constant.font,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: Get.height * .01),
              SizedBox(
                width: 278,
                child: Text(
                  'Your order has been placed successfully and you are one step closer to making your dream event a reality.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(constant.lightGrey),
                    fontSize: 12,
                    fontFamily: constant.font,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: Get.height * .01),
              Button(
                  label: 'Continue Planning',
                  onPressed: () {
                    Get.offAllNamed(NamedRoutes.homepage);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
