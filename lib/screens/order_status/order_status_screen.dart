import 'package:eventually_user/constants/font.dart';
import 'package:eventually_user/controllers/order_btn_controller.dart';
import 'package:eventually_user/controllers/place_order_controller.dart';
import 'package:eventually_user/screens/orders/components/action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../controllers/order_pic_controller.dart';
import '../../routes.dart';
import '../../widget/price_people_text.dart';
import '../../widget/product_categories.dart';
import '../../widget/product_image_view.dart';
import '../../widget/product_title_text.dart';
import '../../widget/text_appbar.dart';
import '../../constants/constant.dart';
import 'components/order_date.dart';
import 'components/order_duration.dart';
import 'components/order_location.dart';

// ignore: must_be_immutable
class OrderStatusScreen extends StatelessWidget {
  OrderStatusScreen({super.key});
  final List<String> _list = [
    'Order\nPending',
    'Order\nCompleted/Verified',
  ];
  OrderPicController orderPicController = Get.put(OrderPicController());
  final placeorderController = Get.put(placeOrderController());
  final orderBtnController = Get.put(OrdersBtnController());
  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    String vendorName = arguments[0];
    String serviceName = arguments[1];
    // String orderNo = placeorderController.orderNumber.value;
    // String serviceDesc = orderBtnController.serviceDesc.value;
    String location = arguments[2];
    String price = arguments[3];
    String NoOfPerson = arguments[4];
    var date = arguments[5];
    String serviceDesc = arguments[6];
    String orderNo = arguments[7];
    String startTime = arguments[8];
    String endTime = arguments[9];
    String userId = arguments[10];

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
          'Orders Details',
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
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * .02, vertical: Get.height * .02),
                child: StepProgressIndicator(
                  totalSteps: _list.length,
                  currentStep: 1,
                  size: Get.height * .08,
                  padding: Get.width * .02,
                  selectedColor: Color(constant.red),
                  unselectedColor: Colors.grey,
                  customStep: makeProgressSteps,
                ),
              ),
              ProductImageView(orderPicController: orderPicController),
              ProductTitleText(title: serviceName),
              Text("Order Number: $orderNo", style: kRedTextStyle),
              SizedBox(height: Get.height * .015),
              ProductDescription(description: serviceDesc),
              SizedBox(height: Get.height * .015),
              const PriceAndPeopleText(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${price} Rs",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Color(constant.lightGrey),
                      fontSize: 24,
                      fontFamily: constant.font,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    NoOfPerson,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(constant.lightGrey),
                      fontSize: 24,
                      fontFamily: constant.font,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              SizedBox(height: Get.height * .015),
              OrderDate(date: date),
              OrderLocation(location: location),
              OrderDuration(startTime: startTime, endTime: endTime),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Order Completed? Verify here',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(constant.lightGrey),
                        fontSize: 10.52,
                        fontFamily: constant.font,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                    child: ActionButton(
                      onTap: () =>
                          Get.toNamed(NamedRoutes.verifyOrder, arguments: [
                        serviceName,
                        orderNo,
                        userId,
                      ]),
                      color: Color(constant.green),
                      text: 'Verify',
                    ),
                  )
                ],
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
