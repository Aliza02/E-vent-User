import 'package:eventually_user/controllers/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant.dart';

class PriceAndPeopleText extends StatelessWidget {
  const PriceAndPeopleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homePageController = Get.put(homepage_controller());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Price',
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: const Color(0x7F555454),
            fontSize: 12,
            fontFamily: constant.font,
            fontWeight: FontWeight.w700,
          ),
        ),
        Obx(
          () => homePageController.businessCategory.value == 'Photographer'
              ? Text('')
              : homePageController.businessCategory.value == 'Bakery'
                  ? Text(
                      'Quantity',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: const Color(0x7F555454),
                        fontSize: 12,
                        fontFamily: constant.font,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : Text(
                      'Person',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: const Color(0x7F555454),
                        fontSize: 12,
                        fontFamily: constant.font,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
        )
      ],
    );
  }
}
