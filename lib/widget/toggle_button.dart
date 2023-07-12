import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant.dart';
import '../controllers/cart_controller.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ToggleButtonController());

    return SizedBox(
      width: Get.width * .08,
      child: Obx(
        () => GestureDetector(
          onTap: controller.toggle,
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
                color: controller.isToggled.value
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
