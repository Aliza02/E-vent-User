import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/controllers/order_btn_controller.dart';
import 'package:eventually_user/routes.dart';
import 'package:eventually_user/screens/orders/components/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/order_pic_controller.dart';
// import '../../routes.dart';
import '../../widget/product_image_view.dart';
import '../../widget/product_title_text.dart';
import '../../widget/text_appbar.dart';
import '../../constants/constant.dart';

// ignore: must_be_immutable
class ReviewScreen extends StatelessWidget {
  ReviewScreen({super.key});
  OrderPicController orderPicController = Get.find<OrderPicController>();
  final OrdersBtnController controller = Get.put(OrdersBtnController());
  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    String serviceName = arguments[0];
    String orderNo = arguments[1];
    String userId = arguments[2];
    double userRating = 0.0;
    TextEditingController reviewController = TextEditingController();
    return Scaffold(
      appBar: const TextAppBar(title: 'Review'),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .08),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                ProductImageView(orderPicController: orderPicController),
                ProductTitleText(title: serviceName),
                Text("Order Number: ${orderNo}", style: kRedTextStyle),
                SizedBox(height: Get.height * .015),
                Text(
                  'How did you like this item?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(constant.lightGrey),
                    fontSize: 16,
                    fontFamily: constant.font,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                //!Star Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: AppColors.pink,
                      ),
                      onRatingUpdate: (rating) {
                        userRating = rating;
                        print(userRating);
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Text(
                  'Thoughts?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(constant.lightGrey),
                    fontSize: 16,
                    fontFamily: constant.font,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    Container(
                        width: Get.width * .75,
                        height: Get.height * .25,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: shadowsAll,
                        ),
                        child: TextFormField(
                          controller: reviewController,
                          decoration: InputDecoration(
                            hintText: 'Write a Review...',
                            hintStyle: TextStyle(
                              color: Color(constant.fieldTextHint),
                              fontSize: 16,
                              fontFamily: constant.font,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                        )
                        // Text(
                        //   'Write a Review...',
                        //   style: TextStyle(
                        //     color: Color(constant.fieldTextHint),
                        //     fontSize: 16,
                        //     fontFamily: constant.font,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                        ),
                  ],
                ),
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
                        element.reference.update({
                          'review': reviewController.text,
                          'rating': userRating.toString(),
                        });
                      });
                    });
                    controller.setAllButtonColor();
                    Get.toNamed(NamedRoutes.order);
                  },
                  color: Color(constant.red),
                  text: 'Submit',
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
