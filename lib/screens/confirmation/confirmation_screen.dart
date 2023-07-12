import 'package:eventually_user/screens/cart/components/custom_stepper.dart';
import 'package:eventually_user/screens/home_page/home_page.dart';
import 'package:eventually_user/screens/orders/components/order_card.dart';
import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';
import 'components/confirmation_text_field.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TextAppBar(title: 'Confirmation'),
      bottomNavigationBar: const CustomBottomNabBar(),
      body: SafeArea(
          child: Column(
        children: [
          const CustomStepper(
            stepTitle: [
              ['Cart', false],
              ['Confirmation', true],
              ['Checkout', false]
            ],
          ),
          SizedBox(height: Get.height * .25, child: OrderCard()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * .06, vertical: Get.width * .06),
              width: double.infinity,
              // height: Get.height * .4,
              decoration: ShapeDecoration(
                shadows: shadowsAbove,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Form(
                // key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Personal Information',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: Get.height * .02),
                    const ConfirmationTextFieldRow(title: 'First Name:'),
                    SizedBox(height: Get.height * .02),
                    const ConfirmationTextFieldRow(title: 'Last Name:'),
                    SizedBox(height: Get.height * .02),
                    const ConfirmationTextFieldRow(title: 'Phone No:'),
                    SizedBox(height: Get.height * .02),
                    const ConfirmationTextFieldRow(title: 'Address:'),
                    SizedBox(height: Get.height * .02),
                    const ConfirmationTextFieldRow(title: 'Date & Time:')
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Button(
            label: 'Confirm',
            onPressed: () {
              // if(_formKey.currentState.validate)
              Get.toNamed('/checkout');
            },
          ),
          SizedBox(height: Get.height * .01),
        ],
      )),
    );
  }
}
