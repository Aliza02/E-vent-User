import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/controllers/offer_btn_controller.dart';
import 'package:eventually_user/controllers/place_order_controller.dart';
import 'package:eventually_user/screens/cart/components/custom_stepper.dart';
import 'package:eventually_user/screens/home_page/home_page.dart';
import 'package:eventually_user/screens/orders/components/order_card.dart';
import 'package:eventually_user/widget/button.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../routes.dart';
import 'components/confirmation_text_field.dart';

class ConfirmationScreen extends StatelessWidget {
  final placeorderController = Get.put(placeOrderController());
  final btnController = Get.put(ButtonController());
  ConfirmationScreen({super.key});
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void validate() {
    if (placeorderController.firstName.text.isNotEmpty &&
        placeorderController.lastName.text.isNotEmpty &&
        placeorderController.phoneNo.text.isNotEmpty) {
      Get.toNamed(NamedRoutes.checkout);
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Incomplete Fields',
          message: 'Enter complete details ',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              // placeordercontroller.firstName.clear();
              // placeordercontroller.lastName.clear();
              // placeordercontroller.phoneNo.clear();
              // placeorderController.serviceName.clear();
              // placeorderController.servicePrice.clear();
              // placeorderController.vendorName.clear();
              // placeorderController.location.clear();
              // placeorderController.noOfPerson.clear();

              // placeorderController.date.clear();

              // btnController.selectedItemToCheckout.clear();

              // for (int i = 0; i < btnController.isSelected.length; i++) {
              //   btnController.isSelected.add(false);
              // }
              // Get.offAndToNamed(NamedRoutes.myCart);
              placeorderController.disableToggle.value = false;
              Get.back();
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Confirmation',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: constant.font,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Column(
          children: [
            const CustomStepper(
              stepTitle: [
                ['Cart', false],
                ['Confirmation', true],
                ['Checkout', false]
              ],
            ),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: btnController.selectedItemToCheckout.length,
                itemBuilder: (context, index) {
                  if (placeorderController.serviceName.isEmpty) {
                    print('empty');
                  }
                  print(index);
                  return OrderCard(
                    status: 'dummy',
                    userId: 'dummy',
                    endTime: 'dummy',
                    startTime: 'dummy',
                    orderNo: 'dummy',
                    serviceDesc: 'dummy',
                    index: btnController.selectedItem.value,
                    date: placeorderController
                        .date[btnController.selectedItemToCheckout[index]],
                    vendorName: placeorderController.vendorName[
                        btnController.selectedItemToCheckout[index]],
                    vendorServiceName: placeorderController.serviceName[
                        btnController.selectedItemToCheckout[index]],
                    location: placeorderController
                        .location[btnController.selectedItemToCheckout[index]],
                    price: placeorderController.servicePrice[
                        btnController.selectedItemToCheckout[index]],
                    noOfPerson: placeorderController.noOfPerson[
                        btnController.selectedItemToCheckout[index]],
                    show: true,
                  );
                },
              ),
            ),

            // SizedBox(height: Get.height * .25, child: OrderCard()),

            // const Spacer(),
            SizedBox(
              width: Get.width * 0.6,
              child: Button(
                label: 'Confirm',
                onPressed: () {
                  // if(_formKey.currentState.validate)
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: Get.height * 0.7,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * .06,
                                vertical: Get.width * .06),
                            // width: double.infinity,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                      maxLength: 500,
                                      controller:
                                          placeorderController.firstName,
                                      inputType: TextInputType.text),
                                  SizedBox(height: Get.height * .02),
                                  ConfirmationTextFieldRow(
                                      maxLength: 500,
                                      title: 'Last Name:',
                                      controller: placeorderController.lastName,
                                      inputType: TextInputType.text),
                                  SizedBox(height: Get.height * .02),
                                  ConfirmationTextFieldRow(
                                      maxLength: 11,
                                      title: 'Phone No:',
                                      controller: placeorderController.phoneNo,
                                      inputType: TextInputType.phone),
                                  SizedBox(height: Get.height * .02),
                                  SizedBox(
                                    width: Get.width * 0.4,
                                    child: Obx(
                                      () => placeorderController
                                                  .confirmOrder.value ==
                                              false
                                          ? Button(
                                              label: 'Next',
                                              onPressed: () {
                                                placeorderController
                                                    .confirmOrder.value = true;
                                                validate();
                                              },
                                            )
                                          : const SpinKitFadingCircle(
                                              color: AppColors.pink,
                                            ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                  // Get.toNamed(NamedRoutes.checkout);
                },
              ),
            ),
            SizedBox(height: Get.height * .01),
          ],
        ),
      ),
    );
  }
}
