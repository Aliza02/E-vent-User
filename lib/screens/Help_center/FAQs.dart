import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/constants/font.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQs extends StatefulWidget {
  const FAQs({super.key});

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  List<bool> _customIcon = [false, false, false, false, false, false];
  List<String> questions = [
    "How to place an order?",
    "How can I negotiate on a price?",
    "How can i cancel my order?",
    "What is the advance payment for?",
    "How does the payment method works?",
    "What is “Make an offer” ?"
  ];

  String answer =
      'Go to the product that you want to place an order for and press “ add to cart” if you don’t want any customization in either the product itself or it’s price. If you have any customization requests click on the “ chat with vendor “ option and negotiate your requirements with the vendor and make offers according to your budget and needs.';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          title: const Text('FAQs'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  "FAQs",
                  style: TextStyle(
                    color: const Color.fromRGBO(203, 88, 90, 1),
                    fontSize: Get.width * 0.07,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        title: Text(
                          questions[index],
                          style: TextStyle(
                              fontFamily: AppFonts.manrope,
                              fontSize: Get.width * 0.045,
                              color: AppColors.grey),
                        ),
                        trailing: ImageIcon(
                          _customIcon[index]
                              ? const AssetImage("assets/images/down.png")
                              : const AssetImage("assets/images/arrow.png"),
                          color: AppColors.grey,
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              'Go to the product that you want to place an order for and press “ add to cart” if you don’t want any customization in either the product itself or it’s price. If you have any customization requests click on the “ chat with vendor “ option and negotiate your requirements with the vendor and make offers according to your budget and needs.',
                              style: TextStyle(
                                  fontFamily: AppFonts.manrope,
                                  fontSize: Get.width * 0.045,
                                  color: AppColors.grey),
                            ),
                          ),
                        ],
                        onExpansionChanged: (bool expanded) {
                          setState(() => _customIcon[index] = expanded);
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
