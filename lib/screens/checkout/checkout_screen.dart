import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/controllers/message_controller.dart';
import 'package:eventually_user/controllers/offer_btn_controller.dart';
import 'package:eventually_user/controllers/place_order_controller.dart';
import 'package:eventually_user/screens/home_page/home_page.dart';
import 'package:eventually_user/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../routes.dart';
import '../../widget/text_appbar.dart';
import '../cart/components/custom_stepper.dart';
import '../orders/components/order_card.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final placeordercontroller = Get.put(placeOrderController());
  final btnController = Get.put(ButtonController());
  final msgController = Get.put(MessageController());
  double advance = 0.0;
  // int total = 0.0;
  int price = 0;
  Map<String, dynamic>? paymentIntent;

  Future<void> makePayment() async {
    print('asd');
    try {
      paymentIntent = await createPaymentIntent();
      // var gpay = const PaymentSheetGooglePay(
      //   merchantCountryCode: "USD",
      //   currencyCode: "USD",
      //   testEnv: true,
      // );

      print('stripe');
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          setupIntentClientSecret:
              'sk_test_51No9dKEputI98S5HV8rrrOmklr3Ehat6EV03K5ztEQKnTQX6WpNthFRiuS5viHFpA8TJg7BEnyRpHgDdcSmGvttz00nKVUT6Yz',
          paymentIntentClientSecret: paymentIntent!["client_secret"],
          merchantDisplayName: 'EventuAlly',
          // googlePay: gpay,
        ),
      );
      print('payment');
      displayPaymentSheet();
    } catch (e) {}
  }

  // void displayPaymentSheet() async {
  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        Get.dialog(AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100.0,
              ),
              SizedBox(height: 10.0),
              Text("Payment Successful!"),
            ],
          ),
        ));

        paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent() async {
    try {
      Map<String, dynamic> body = {
        "amount": "1000",
        "currency": "USD",
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          "Authorization":
              'Bearer {sk_test_51No9dKEputI98S5HV8rrrOmklr3Ehat6EV03K5ztEQKnTQX6WpNthFRiuS5viHFpA8TJg7BEnyRpHgDdcSmGvttz00nKVUT6Yz}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );

      return json.decode(response.body);
    } catch (e) {}
    // throw Exception(e.String());
  }

  void calculateAmount() {
    for (int i = 0; i < btnController.selectedItemToCheckout.length; i++) {
      print(btnController.selectedItemToCheckout.length);
      price = int.parse(placeordercontroller.servicePrice[i]);
      advance += price * 0.2;
      // total =
    }
  }

  String generateOrderNumber() {
    // Get the current timestamp in milliseconds
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    // Generate a random 2-digit number
    int randomValue =
        Random().nextInt(90) + 10; // Generates a number between 10 and 99

    // Combine the timestamp and random number to create the order number
    String orderNumber = '$timestamp$randomValue';
    print(orderNumber);

    // Ensure the order number is exactly 6 digits by padding with zeros if needed
    if (orderNumber.length < 6) {
      orderNumber = orderNumber.padLeft(6, '0');
    } else if (orderNumber.length > 6) {
      // If the timestamp is too long, truncate it
      orderNumber = orderNumber.substring(9, 15);
    }

    return orderNumber;
  }

  @override
  void initState() {
    super.initState();
    calculateAmount();
  }

  void sendOrder(int index) async {
    String firstName = placeordercontroller.firstName.text;
    String phoneNo = placeordercontroller.phoneNo.text;
    String orderNo = placeordercontroller.orderNumber.value;
    String startTime = placeordercontroller.startTime.value.toString();
    String endTime = placeordercontroller.endTime.value.toString();
    await FirebaseFirestore.instance
        .collection('Orders')
        .doc(msgController.chatRoomId.value)
        .set({'test': '123'});
    await FirebaseFirestore.instance
        .collection('Orders')
        .doc(msgController.chatRoomId.value)
        .collection('bookings')
        .doc(placeordercontroller.serviceName[index])
        .set({
      'Vendor Name': placeordercontroller.vendorName[index],
      'Service Name': placeordercontroller.serviceName[index],
      'Service Price': placeordercontroller.servicePrice[index],
      'location': placeordercontroller.location[index],
      'No of Person': placeordercontroller.noOfPerson[index],
      'Date of Delivery': placeordercontroller.date[index],
      'Order No': orderNo,
      'Customer Name': firstName,
      'Contact': phoneNo,
      'status': 'active',
      'isCancelled': false,
      'order placed': DateTime.now().millisecondsSinceEpoch,
      'Start time': startTime,
      'End time': endTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    // int price = int.parse(placeordercontroller.servicePrice[0]);

    return SafeArea(
      // bottomNavigationBar: const CustomBottomNabBar(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              placeordercontroller.firstName.clear();
              placeordercontroller.lastName.clear();
              placeordercontroller.phoneNo.clear();
              placeordercontroller.confirmOrder.value = false;
              Get.offAndToNamed(NamedRoutes.orderConfirmation);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Checkout',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: constant.font,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomStepper(
                stepTitle: [
                  ['Cart', false],
                  ['Confirmation', false],
                  ['Checkout', true]
                ],
              ),
              // SizedBox(height: Get.height * .24, child: OrderCard()),
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
                      Text(
                        'Payment Method',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: constant.font,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Choose a payment method',
                        style: TextStyle(
                          color: Color(constant.lightGrey),
                          fontSize: 12,
                          fontFamily: constant.font,
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
                              color: Color(0xFFCB585A),
                              shape: OvalBorder(
                                side: BorderSide(
                                    width: 0.50, color: Color(0xFFCB585A)),
                              ),
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          InkWell(
                            onTap: () {
                              // makePayment();
                              print('done payment');
                            },
                            child: Text('COD'),

                            //  Image.asset(
                            //   'assets/images/easypaisa.png',
                            //   width: Get.width * .2,
                            // ),
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       width: 11,
                      //       height: 11,
                      //       decoration: const ShapeDecoration(
                      //         color: Color(0xFFF9F9F9),
                      //         shape: OvalBorder(
                      //           side: BorderSide(
                      //               width: 0.50, color: Color(0xFFCB585A)),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(width: Get.width * .05),
                      //     InkWell(
                      //       onTap: () {
                      //         // makePayment();
                      //         print('done payment');
                      //       },
                      //       child: Image.asset(
                      //         'assets/images/easypaisa.png',
                      //         width: Get.width * .2,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: Get.height * .01),
                      // Row(
                      //   children: [
                      //     Container(
                      //       width: 11,
                      //       height: 11,
                      //       decoration: const ShapeDecoration(
                      //         color: Color(0xFFF9F9F9),
                      //         shape: OvalBorder(
                      //           side: BorderSide(
                      //               width: 0.50, color: Color(0xFFCB585A)),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(width: Get.width * .05),
                      //     Image.asset(
                      //       'assets/images/master_card.png',
                      //       width: Get.width * .13,
                      //     )
                      //   ],
                      // ),
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
                      Text(
                        'Delivery',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: constant.font,
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
                              color: Color(constant.red),
                              shape: const OvalBorder(
                                side: BorderSide(
                                    width: 0.50, color: Color(0xFFCB585A)),
                              ),
                              shadows: shadowsAbove,
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          Text(
                            placeordercontroller.location[0],
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(constant.lightGrey),
                              fontSize: 12,
                              fontFamily: constant.font,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      // SizedBox(height: Get.height * .01),
                      // Row(
                      //   children: [
                      //     Container(
                      //       width: 11,
                      //       height: 11,
                      //       decoration: const ShapeDecoration(
                      //         color: Color(0xFFF9F9F9),
                      //         shape: OvalBorder(
                      //           side: BorderSide(
                      //               width: 0.50, color: Color(0xFFCB585A)),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(width: Get.width * .05),
                      //     Text(
                      //       'Add another location',
                      //       style: TextStyle(
                      //         color: Color(constant.lightGrey),
                      //         fontSize: 12,
                      //         fontFamily: constant.font,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     )
                      //   ],
                      // ),
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
                      Text(
                        'Order Summary',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: constant.font,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cost',
                            style: TextStyle(
                              color: Color(constant.lightGrey),
                              fontSize: 12,
                              fontFamily: constant.font,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          Text(
                            placeordercontroller.servicePrice[0],
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(constant.lightGrey),
                              fontSize: 12,
                              fontFamily: constant.font,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount',
                            style: TextStyle(
                              color: Color(constant.lightGrey),
                              fontSize: 12,
                              fontFamily: constant.font,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          Text(
                            '-',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(constant.lightGrey),
                              fontSize: 12,
                              fontFamily: constant.font,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Advance',
                            style: TextStyle(
                              color: Color(constant.lightGrey),
                              fontSize: 12,
                              fontFamily: constant.font,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          Text(
                            advance.toString(),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(constant.lightGrey),
                              fontSize: 12,
                              fontFamily: constant.font,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery',
                            style: TextStyle(
                              color: Color(constant.lightGrey),
                              fontSize: 12,
                              fontFamily: constant.font,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          Text(
                            '-',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(constant.lightGrey),
                              fontSize: 12,
                              fontFamily: constant.font,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                              color: const Color(0xFF3C191E),
                              fontSize: 18,
                              fontFamily: constant.font,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: Get.width * .05),
                          Text(
                            price.toString(),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(constant.lightGrey),
                              fontSize: 18,
                              fontFamily: constant.font,
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
                          int randomValue = Random().nextInt(90) + 10;
                          String orderNumber = generateOrderNumber();
                          placeordercontroller.orderNumber.value = orderNumber;

                          // print(randomValue);
                          // String orderNumber = generateOrderNumber();
                          // print('Generated Order Number: $orderNumber');
                          // // makePayment();
                          for (int i = 0;
                              i < btnController.selectedItemToCheckout.length;
                              i++) {
                            sendOrder(i);
                          }
                          Get.toNamed(NamedRoutes.orderPlaced);
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
