import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';
import '../../../controllers/product_controller.dart';

class IncrDecrPeopleBtn extends StatelessWidget {
  IncrDecrPeopleBtn({
    super.key,
    required this.icon,
  });
  final IconData icon;
  final OrderController controller = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        icon == Icons.add
            ? controller.increasePeopleCount()
            : controller.decreasePeopleCount();
      },
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        width: 20,
        height: 20,
        decoration: ShapeDecoration(
          color: icon == Icons.remove
              ? const Color(0x33878787)
              : Color(constant.red),
          shape: const OvalBorder(),
          shadows: [
            BoxShadow(
              color: icon == Icons.remove
                  ? const Color(0x33878787)
                  : Color(constant.red),
              blurRadius: 2.40,
              offset: const Offset(0, 0.80),
              spreadRadius: 0,
            )
          ],
        ),
        child: Icon(
          icon,
          size: 12,
          color: icon == Icons.remove ? null : Colors.white,
        ),
      ),
    );
  }
}
