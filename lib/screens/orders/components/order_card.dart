import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/cart_controller.dart';
import '../../../widget/toggle_button.dart';

// ignore: must_be_immutable
class OrderCard extends StatelessWidget {
  OrderCard({super.key, this.show});
  final controller = Get.put(ToggleButtonController());
  bool? show = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * .03, vertical: Get.height * .015),
      child: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: () => Get.toNamed('/orderstatus'),
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * .03, vertical: Get.height * .015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        show == true ? const ToggleButton() : const SizedBox(),
                        const Text(
                          'Saleem Caterers',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * .01),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        show == true ? const ToggleButton() : const SizedBox(),
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
                              const Text(
                                'Shadi Package',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const Text(
                                'Date : 21-05-2023',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color(0xFF555454),
                                  fontSize: 8,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Text(
                                'Location : XYZ building XYZ block, Latifabad, Hyd.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color(0xFF555454),
                                  fontSize: 8,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                  height: show != null
                                      ? Get.height * .02
                                      : Get.height * .04),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '50,000 Rs',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Color(0xFF9C0C0C),
                                      fontSize: 18,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'per 100 person',
                                    style: TextStyle(
                                      color: Color(0xFFA2A2A2),
                                      fontSize: 9,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
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
        ],
      ),
    );
  }
}
