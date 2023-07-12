import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/order_pic_controller.dart';
import '../screens/order_status/components/image_counter_row.dart';

class ProductImageView extends StatelessWidget {
  const ProductImageView({
    super.key,
    required this.orderPicController,
  });

  final OrderPicController orderPicController;

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
                child: Image.asset(
                  'assets/images/caterers.jpg',
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
