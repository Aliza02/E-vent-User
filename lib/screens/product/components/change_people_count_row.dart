import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/product_controller.dart';

import 'incr_decr_btn.dart';

class ChangePeopleCountRow extends StatelessWidget {
  ChangePeopleCountRow({
    super.key,
  });
  final OrderController controller = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          IncrDecrPeopleBtn(icon: Icons.remove),
          SizedBox(width: Get.width * .01),
          Obx(
            () => Text(
              controller.peopleCount.toString(),
              style: const TextStyle(
                color: Color(0xFF555454),
                fontSize: 24,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: Get.width * .01),
          IncrDecrPeopleBtn(icon: Icons.add),
        ],
      ),
    );
  }
}
