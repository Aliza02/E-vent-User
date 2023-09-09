import 'package:eventually_user/controllers/vendor_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/order_pic_controller.dart';
import '../screens/order_status/components/image_counter_row.dart';

class ProductImageView extends StatelessWidget {
  ProductImageView({
    super.key,
    required this.orderPicController,
  });

  final OrderPicController orderPicController;
  final vendorController = Get.put(vendorDetailController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.22, // Set a specific height for the PageView
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            onPageChanged: (index) {
              orderPicController.index.value = index;
            },
            itemBuilder: (context, index) => Container(
              width: double.infinity,
              height: Get.height * .3,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  vendorController.serviceImages[index],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          bottom: 8,
          right: 0,
          left: 0,
          child: ImageCounterRow(),
        ),
      ],
    );
  }
}
