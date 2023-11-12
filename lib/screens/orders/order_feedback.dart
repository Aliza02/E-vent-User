import 'package:eventually_user/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/order_pic_controller.dart';
import '../../routes.dart';
import '../../widget/product_image_view.dart';
import '../../widget/text_appbar.dart';
import 'components/action_button.dart';
import 'components/feedback_field.dart';

class OrderFeedBack extends StatelessWidget {
  OrderFeedBack({super.key});
  final OrderPicController orderPicController = Get.put(OrderPicController());

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    String serviceName = arguments[0];
    String orderNo = arguments[1];
    return Scaffold(
      appBar: const TextAppBar(title: 'Order Cancellation'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .08),
        child: SingleChildScrollView(
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
                'Order Cancelled',
                style: TextStyle(
                  color: Color(constant.icon),
                  fontSize: 24,
                  fontFamily: constant.font,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Kindly take a moment to explain the reason behind canceling the order. We value your opinion and we’ll work towards erasing your concerns.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(constant.lightGrey),
                  fontSize: 16,
                  fontFamily: constant.font,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              const FeedBackField(),
              const SizedBox(height: 20),
              ActionButton(
                color: Color(constant.red),
                onTap: () => Get.toNamed(NamedRoutes.drawer),
                text: 'Submit',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
