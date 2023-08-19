import 'package:eventually_user/screens/orders/components/action_button.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
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
                const ProductTitleText(),
                Text('Order Number: 098765', style: kRedTextStyle),
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
                    SizedBox(
                        width: 30, child: Image.asset('assets/icons/star.png')),
                    SizedBox(
                        width: 30, child: Image.asset('assets/icons/star.png')),
                    SizedBox(
                        width: 30, child: Image.asset('assets/icons/star.png')),
                    SizedBox(
                        width: 30,
                        child: Image.asset('assets/icons/star_outlined.png')),
                    SizedBox(
                        width: 30,
                        child: Image.asset('assets/icons/star_outlined.png')),
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
                      child: Text(
                        'Write a Review...',
                        style: TextStyle(
                          color: Color(constant.fieldTextHint),
                          fontSize: 16,
                          fontFamily: constant.font,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Row(
                        children: [
                          InkWell(
                            child: SvgPicture.asset('assets/icons/upload.svg'),
                            onTap: () {},
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            child:
                                SvgPicture.asset('assets/icons/feedback.svg'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ActionButton(
                  onTap: () {
                    //=> Get.toNamed(NamedRoutes.verifiedOrder)
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
