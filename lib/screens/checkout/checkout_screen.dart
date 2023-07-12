import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/screens/home_page/home_page.dart';
import 'package:eventually_user/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/text_appbar.dart';
import '../cart/components/custom_stepper.dart';
import '../orders/components/order_card.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TextAppBar(title: 'Checkout(1)'),
      bottomNavigationBar: const CustomBottomNabBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomStepper(
                stepTitle: [
                  ['Cart', false],
                  ['Confirmation', false],
                  ['Checkout', true]
                ],
              ),
              SizedBox(height: Get.height * .24, child: OrderCard()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * .03),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * .06, vertical: Get.height * .01),
                  // height: Get.height * .16,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: shadowsAbove,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Payment Method',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Text(
                        'Choose a payment method',
                        style: TextStyle(
                          color: Color(0xFF555454),
                          fontSize: 12,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        children: [
                          Container(
                            width: 11,
                            height: 11,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFF9F9F9),
                              shape: OvalBorder(
                                side: BorderSide(
                                    width: 0.50, color: Color(0xFFCB585A)),
                              ),
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          Image.asset(
                            'assets/images/easypaisa.png',
                            width: Get.width * .2,
                          )
                        ],
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        children: [
                          Container(
                            width: 11,
                            height: 11,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFF9F9F9),
                              shape: OvalBorder(
                                side: BorderSide(
                                    width: 0.50, color: Color(0xFFCB585A)),
                              ),
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          Image.asset(
                            'assets/images/master_card.png',
                            width: Get.width * .13,
                          )
                        ],
                      ),
                      SizedBox(height: Get.height * .01),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height * .01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * .03),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * .06, vertical: Get.height * .01),
                  // height: Get.height * .13,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: shadowsAbove,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Delivery',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        children: [
                          Container(
                            width: 11,
                            height: 11,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFCB585A),
                              shape: const OvalBorder(
                                side: BorderSide(
                                    width: 0.50, color: Color(0xFFCB585A)),
                              ),
                              shadows: shadowsAbove,
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          const Text(
                            'House# 12/98 XYZ Building, Latifabad Hyd.',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF555454),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        children: [
                          Container(
                            width: 11,
                            height: 11,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFF9F9F9),
                              shape: OvalBorder(
                                side: BorderSide(
                                    width: 0.50, color: Color(0xFFCB585A)),
                              ),
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          const Text(
                            'Add another location',
                            style: TextStyle(
                              color: Color(0xFF555454),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Get.height * .01),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height * .01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * .03),
                child: Container(
                  padding: EdgeInsets.all(Get.width * .06),
                  // height: Get.height * .25,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: shadowsAbove,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Order Summary',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Cost',
                            style: TextStyle(
                              color: Color(0xFF555454),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          const Text(
                            '50,000',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF555454),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Discount',
                            style: TextStyle(
                              color: Color(0xFF555454),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          const Text(
                            '-',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF555454),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Advance (20 %)',
                            style: TextStyle(
                              color: Color(0xFF555454),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          const Text(
                            '10,000',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF555454),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Delivery',
                            style: TextStyle(
                              color: Color(0xFF555454),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          const Text(
                            '250',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF555454),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Price',
                            style: TextStyle(
                              color: Color(0xFF3C191E),
                              fontSize: 18,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          const Text(
                            'Rs 10,250',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF555454),
                              fontSize: 18,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height * .02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * .06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                        label: 'Checkout',
                        onPressed: () {
                          Get.toNamed('/order_placed');
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
