import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/order_btn_controller.dart';
import '../../widget/text_appbar.dart';
import 'components/all_orders.dart';
import 'components/button.dart';
import 'components/order_card.dart';

// late Size Get;

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  final OrdersBtnController controller = Get.put(OrdersBtnController());

  @override
  Widget build(BuildContext context) {
    if (controller.isFirstButtonActive.value) {
      controller.setActiveButtonColor();
    } else {
      controller.setAllButtonColor();
    }
    return Scaffold(
      appBar: const TextAppBar(title: 'Your Orders'),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: Get.width * .06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => ListOrderButton(
                    title: 'Active Orders',
                    color: controller.activeButtonColor.value,
                    onpressed: () {
                      controller.setActiveButtonColor();
                    },
                  ),
                ),
                SizedBox(width: Get.width * .05),
                Obx(
                  () => ListOrderButton(
                    title: 'All Orders',
                    color: controller.allButtonColor.value,
                    onpressed: () {
                      controller.setAllButtonColor();
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Get.height * .01),
          Obx(
            () => controller.isFirstButtonActive.value
                ? Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) => OrderCard(),
                    ),
                  )
                : const AllOrders(),
          )
        ],
      ),
    );
  }
}
