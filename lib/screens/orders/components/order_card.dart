import 'package:eventually_user/controllers/place_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';
import '../../../controllers/cart_controller.dart';
import '../../../routes.dart';
import '../../../widget/toggle_button.dart';

// ignore: must_be_immutable
class OrderCard extends StatelessWidget {
  final String vendorName;
  final String vendorServiceName;
  final String location;
  final String price;
  final String noOfPerson;
  final date;
  final int index;

  OrderCard(
      {super.key,
      this.show,
      required this.vendorName,
      required this.vendorServiceName,
      required this.location,
      required this.price,
      required this.date,
      required this.noOfPerson,
      required this.index});
  final controller = Get.put(ToggleButtonController());
  bool? show = true;
  @override
  Widget build(BuildContext context) {
    final placeorderController = Get.put(placeOrderController());
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * .03, vertical: Get.height * .015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: () {},
              // => Get.toNamed(NamedRoutes.orderStatus),
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * .03, vertical: Get.height * .015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () =>
                              placeorderController.disableToggle.value == false
                                  ? ToggleButton(
                                      index: index,
                                      enableAllItems: false,
                                    )
                                  : SizedBox(
                                      width: Get.width * 0.06,
                                    ),
                        ),
                        Text(
                          vendorName,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: constant.font,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * .01),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        show == true &&
                                placeorderController.disableToggle.value ==
                                    false
                            ? ToggleButton(
                                index: index,
                                enableAllItems: false,
                              )
                            : SizedBox(
                                width: Get.width * 0.06,
                              ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/caterers.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: Get.width * .03),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vendorServiceName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: constant.font,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                "${date.day}-${date.month}-${date.year}",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color(constant.lightGrey),
                                  fontSize: 8,
                                  fontFamily: constant.font,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                location,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color(constant.lightGrey),
                                  fontSize: 8,
                                  fontFamily: constant.font,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "per ${noOfPerson} person",
                                style: TextStyle(
                                  color: const Color(0xFFA2A2A2),
                                  fontSize: 9,
                                  fontFamily: constant.font,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: show != null
                                    ? Get.height * .01
                                    : Get.height * .02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${price} Rs",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: const Color(0xFF9C0C0C),
                                      fontSize: 18,
                                      fontFamily: constant.font,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  show == true
                                      ? const SizedBox()
                                      : Expanded(
                                          child: Ink(
                                            height: 22,
                                            decoration: ShapeDecoration(
                                              color: Color(constant.green),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(11),
                                              ),
                                              shadows: shadowsAbove,
                                            ),
                                            child: InkWell(
                                              onTap: () {},
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              child: Center(
                                                child: Text(
                                                  'Verify',
                                                  style: TextStyle(
                                                    color:
                                                        Color(constant.white),
                                                    fontSize: 8.54,
                                                    fontFamily: constant.font,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => placeorderController.enableCancelOrderButton.value == true
                ? Row(
                    children: [
                      const Spacer(),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: ShapeDecoration(
                          color: Color(constant.lightRed),
                          shape: const OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () => Get.toNamed(NamedRoutes.orderCancellation),
                        child: Text(
                          'Cancel order',
                          style: TextStyle(
                            color: Color(constant.lightRed),
                            fontSize: 9,
                            fontFamily: constant.font,
                            fontWeight: FontWeight.w700,
                            height: 1.30,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
