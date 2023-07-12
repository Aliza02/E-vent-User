import 'package:eventually_user/screens/home_page/home_page.dart';
import 'package:eventually_user/widget/button.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TextAppBar(title: ''),
      bottomNavigationBar: const CustomBottomNabBar(),
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
              const Text(
                'Congratulations!',
                style: TextStyle(
                  color: Color(0xFFCB585A),
                  fontSize: 24,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: Get.height * .01),
              const Text(
                'Your order number is : 123456',
                style: TextStyle(
                  color: Color(0xFF555454),
                  fontSize: 18,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: Get.height * .01),
              const SizedBox(
                width: 278,
                child: Text(
                  'Your order has been placed successfully and you are one step closer to making your dream event a reality.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF555454),
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: Get.height * .01),
              Button(
                  label: 'Continue Planning',
                  onPressed: () {
                    Get.toNamed('/homepage');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
