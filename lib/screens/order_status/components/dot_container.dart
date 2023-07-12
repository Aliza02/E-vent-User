import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';
import '../../../controllers/order_pic_controller.dart';

// ignore: must_be_immutable
class DotContainer extends StatelessWidget {
  OrderPicController orderPicController = Get.find<OrderPicController>();
  DotContainer({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 7,
        height: 7,
        margin: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
        decoration: ShapeDecoration(
          color: orderPicController.index.value == index
              ? Color(constant.red)
              : Color(constant.white),
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}
