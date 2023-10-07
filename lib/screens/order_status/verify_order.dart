import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/constants/font.dart';
import 'package:eventually_user/controllers/order_btn_controller.dart';
import 'package:eventually_user/screens/orders/components/action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../controllers/order_pic_controller.dart';
import '../../routes.dart';
import '../../widget/product_categories.dart';
import '../../widget/product_image_view.dart';
import '../../widget/product_title_text.dart';
import '../../widget/text_appbar.dart';
import '../../constants/constant.dart';

// ignore: must_be_immutable
class VerifyOrderScreen extends StatelessWidget {
  VerifyOrderScreen({super.key});
  final List<String> _list = [
    'Order\nPending',
    'Order\nCompleted/Verified',
  ];
  OrderPicController orderPicController = Get.put(OrderPicController());
  final orderBtnController = Get.put(OrdersBtnController());
  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    String serviceName = arguments[0];
    String orderNo = arguments[1];
    String userId = arguments[2];
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
          'Verify Orders',
          style: TextStyle(
            color: Colors.black,
            fontSize: Get.width * .05,
            fontFamily: AppFonts.manrope,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .08),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Order Status', style: kBlackTextStyle),
              //!progressor
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * .02, vertical: Get.height * .02),
                child: StepProgressIndicator(
                  totalSteps: _list.length,
                  currentStep: 2,
                  size: Get.height * .08,
                  padding: Get.width * .02,
                  selectedColor: Color(constant.red),
                  unselectedColor: Colors.grey,
                  customStep: makeProgressSteps,
                ),
              ),
              ProductImageView(orderPicController: orderPicController),
              ProductTitleText(title: serviceName),
              Text("Order Number:${orderNo}", style: kRedTextStyle),
              SizedBox(height: Get.height * .015),
              const ProductDescription(
                  description:
                      'Kindly verify if your order has been completed. Also, don’t forget to submit a review as it helps vendors grow and improve. '),
              SizedBox(height: Get.height * .015),
              const SizedBox(height: 20),
              ActionButton(
                onTap: () async {
                  await FirebaseFirestore.instance
                      .collection('Orders')
                      .doc(userId)
                      .collection('bookings')
                      .where('Order No', isEqualTo: orderNo)
                      .get()
                      .then((value) {
                    value.docs.forEach((element) {
                      element.reference.update({'status': 'Completed'});
                    });
                  });

                  Get.toNamed(NamedRoutes.verifiedOrder,
                      arguments: [serviceName, orderNo, userId]);
                },
                color: Color(constant.green),
                text: 'Verify',
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget makeProgressSteps(index, color, _) {
    return Column(
      children: [
        Container(
          height: 9,
          decoration: ShapeDecoration(
            color: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          ),
        ),
        SizedBox(height: Get.height * .01),
        SizedBox(
          // width: Get.width * .15,
          child: Text(
            _list[index],
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontFamily: constant.font,
              fontWeight: FontWeight.w800,
            ),
          ),
        )
      ],
    );
  }
}
