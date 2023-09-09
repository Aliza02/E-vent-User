import 'package:eventually_user/controllers/place_order_controller.dart';
import 'package:eventually_user/screens/cart/components/custom_stepper.dart';
import 'package:eventually_user/screens/home_page/home_page.dart';
import 'package:eventually_user/screens/orders/components/order_card.dart';
import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';
import '../../routes.dart';
import 'components/confirmation_text_field.dart';

class ConfirmationScreen extends StatelessWidget {
  final placeorderController = Get.put(placeOrderController());
  ConfirmationScreen({super.key});
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void validate() {
    if (placeorderController.firstName.text.isNotEmpty &&
        placeorderController.lastName.text.isNotEmpty &&
        placeorderController.phoneNo.text.isNotEmpty) {
      Get.toNamed(NamedRoutes.checkout);
    } else {
      Get.snackbar('Incomplete input', 'Fill the above fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        appBar: const TextAppBar(title: 'Confirmation'),
        // bottomNavigationBar: const CustomBottomNabBar(),
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

            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: placeorderController.serviceName.length,
                  itemBuilder: (context, index) {
                    if (placeorderController.serviceName.isEmpty) {
                      print('empty');
                    }
                    print(index);
                    return OrderCard(
                      date: placeorderController.date[index],
                      vendorName: placeorderController.vendorName[index],
                      vendorServiceName:
                          placeorderController.serviceName[index],
                      location: placeorderController.location[index],
                      price: placeorderController.servicePrice[index],
                      noOfPerson: placeorderController.noOfPerson[index],
                      show: true,
                    );
                  },
                ),
              ),
            ),

            // SizedBox(height: Get.height * .25, child: OrderCard()),
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
                      Text(
                        'Personal Information',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Get.width * 0.05,
                          fontFamily: constant.font,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: Get.height * .02),
                      ConfirmationTextFieldRow(
                          title: 'First Name:',
                          controller: placeorderController.firstName,
                          inputType: TextInputType.text),
                      SizedBox(height: Get.height * .02),
                      ConfirmationTextFieldRow(
                          title: 'Last Name:',
                          controller: placeorderController.lastName,
                          inputType: TextInputType.text),
                      SizedBox(height: Get.height * .02),
                      ConfirmationTextFieldRow(
                          title: 'Phone No:',
                          controller: placeorderController.phoneNo,
                          inputType: TextInputType.phone),
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
                Get.toNamed(NamedRoutes.checkout);
              },
            ),
            SizedBox(height: Get.height * .01),
          ],
        )),
      ),
    );
  }
}
