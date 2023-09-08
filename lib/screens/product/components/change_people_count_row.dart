import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';
import '../../../controllers/product_controller.dart';

import 'incr_decr_btn.dart';

class ChangePeopleCountRow extends StatelessWidget {
  final people;
  ChangePeopleCountRow({super.key, required this.people});
  final OrderController controller = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    controller.peopleCount.value = int.parse(this.people);
    return SizedBox(
      child: Row(
        children: [
          IncrDecrPeopleBtn(icon: Icons.remove),
          SizedBox(width: Get.width * .01),
          Obx(
            () => Text(
              controller.peopleCount.value.toString(),
              style: TextStyle(
                color: Color(constant.lightGrey),
                fontSize: 24,
                fontFamily: constant.font,
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
