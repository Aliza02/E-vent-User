import 'package:eventually_user/controllers/offer_btn_controller.dart';
import 'package:eventually_user/controllers/place_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant.dart';
import '../controllers/cart_controller.dart';

class ToggleButton extends StatelessWidget {
  final int index;
  final bool enableAllItems;
  const ToggleButton({
    super.key,
    required this.index,
    required this.enableAllItems,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ToggleButtonController());
    final btnController = Get.put(ButtonController());
    final placeorderController = Get.put(placeOrderController());

    return SizedBox(
      width: Get.width * .08,
      child: Obx(
        () => GestureDetector(
          onTap: () {
            // print(index);
            // print(btnController.isSelected[index]);

            btnController.isSelected[index] = !btnController.isSelected[index];
            btnController.selectedItem.value = index;

            if (btnController.isSelected[index] == false) {
              btnController.selectedItemToCheckout.removeAt(index);
              print(btnController.selectedItemToCheckout.length);
            } else {
              btnController.selectedItemToCheckout
                  .add(btnController.selectedItem.value);
              print(btnController.selectedItemToCheckout.length);
            }
          },
          child: Container(
            width: 16,
            height: 16,
            padding: const EdgeInsets.all(2),
            decoration: const ShapeDecoration(
              shape: CircleBorder(side: BorderSide(width: 0.5)),
              color: Colors.transparent,
            ),
            child: Container(
              width: 10,
              height: 10,
              decoration: ShapeDecoration(
                color: btnController.isSelected[index] == true
                    ? Color(constant.red)
                    : Colors.transparent,
                shape: const CircleBorder(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
