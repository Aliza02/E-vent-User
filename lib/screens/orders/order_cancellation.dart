import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/order_pic_controller.dart';
import '../../routes.dart';
import '../../widget/product_image_view.dart';
import '../../widget/text_appbar.dart';
import 'components/action_button.dart';

class OrderCancellation extends StatelessWidget {
  OrderCancellation({super.key});
  final OrderPicController orderPicController = Get.put(OrderPicController());

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    String serviceName = arguments[0];
    String orderNo = arguments[1];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Order Cancellation',
          style: TextStyle(
            color: AppColors.grey,
            fontSize: Get.width * 0.05,
            fontWeight: AppFonts.bold,
            fontFamily: AppFonts.manrope,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .08),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ProductImageView(orderPicController: orderPicController),
            Text(
              serviceName,
              style: TextStyle(
                color: Color(constant.icon),
                fontSize: 24,
                fontFamily: constant.font,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "Order Number: $orderNo",
              style: TextStyle(
                color: Color(constant.red),
                fontSize: 14,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Are you sure you want to cancel your order?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(constant.lightGrey),
                fontSize: 16,
                fontFamily: constant.font,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            ActionButton(
              color: Color(constant.lightRed),
              onTap: () {
                Get.toNamed(
                  NamedRoutes.orderFeedBack,
                  arguments: [serviceName, orderNo],
                );
              },
              text: 'Cancel',
            )
          ],
        ),
      ),
    );
  }
}
