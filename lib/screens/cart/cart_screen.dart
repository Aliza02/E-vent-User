import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/constants/font.dart';
import 'package:eventually_user/controllers/cart_controller.dart';
import 'package:eventually_user/controllers/place_order_controller.dart';
import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes.dart';
import '../../widget/toggle_button.dart';
import '../home_page/home_page.dart';
import '../orders/components/order_card.dart';
import 'components/custom_stepper.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    final placeorderController = Get.put(placeOrderController());
    final toggleController = Get.put(ToggleButtonController());

    return SafeArea(
      child: Scaffold(
        appBar: const TextAppBar(title: 'My Cart'),
        // bottomNavigationBar: const CustomBottomNabBar(),
        body: Column(
          children: [
            const CustomStepper(
              stepTitle: [
                ['Cart', true],
                ['Confirmation', false],
                ['Checkout', false]
              ],
            ),
            SizedBox(height: Get.height * .01),
            Expanded(
              child: ListView.builder(
                itemCount: placeorderController.serviceName.length,
                itemBuilder: (context, index) {
                  if (placeorderController.serviceName.isEmpty) {
                    print('empty');
                  }
                  print(index);
                  return OrderCard(
                    date: placeorderController.date[index],
                    vendorName: placeorderController.vendorName[index],
                    vendorServiceName: placeorderController.serviceName[index],
                    location: placeorderController.location[index],
                    price: placeorderController.servicePrice[index],
                    noOfPerson: placeorderController.noOfPerson[index],
                    show: true,
                  );
                },
              ),
            ),
            // Spacer(),
            Container(
              // width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: Get.width * .04),
              height: 70,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                shadows: shadowsAbove,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ToggleButton(),
                  SizedBox(
                    width: Get.width * .21,
                    child: Text(
                      'All Items',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(constant.lightGrey),
                        fontSize: 16,
                        fontFamily: constant.font,
                        fontWeight: FontWeight.w500,
                        // height: 20.80,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Obx(
                      () => toggleController.isToggled.value == true
                          ? Button(
                              label: 'Proceed',
                              onPressed: () {
                                placeorderController.cartEnable.value = false;
                                Get.toNamed(NamedRoutes.orderConfirmation);
                              },
                            )
                          : Container(
                              alignment: Alignment.center,
                              height: Get.height * 0.05,
                              width: Get.width * 0.1,
                              decoration: BoxDecoration(
                                color: AppColors.cream,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                'proceed',
                                style: TextStyle(
                                  fontFamily: constant.font,
                                  fontWeight: AppFonts.bold,
                                  fontSize: Get.width * 0.04,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
