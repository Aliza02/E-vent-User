import 'package:eventually_user/constants/constant.dart';
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
    return Scaffold(
      appBar: const TextAppBar(title: 'Order Cancellation'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .08),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ProductImageView(orderPicController: orderPicController),
            Text(
              'Shadi Package',
              style: TextStyle(
                color: Color(constant.icon),
                fontSize: 24,
                fontFamily: constant.font,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Order Number: 098765',
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
              onTap: () => Get.toNamed(NamedRoutes.orderFeedBack),
              text: 'Cancel',
            )
          ],
        ),
      ),
    );
  }
}
