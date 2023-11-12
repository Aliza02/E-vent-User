import 'package:eventually_user/routes.dart';
import 'package:eventually_user/screens/Help_center/FAQs.dart';
import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor:AppColors.appbar.withOpacity(0.3),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ), 
        title: const Text('Help Center'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: Get.height * 0.02),
            child: const Text(
              "How can we help?",
              style: TextStyle(
                  color: Color.fromRGBO(203, 88, 90, 1), fontSize: 28),
            ),
          )),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(NamedRoutes.faq);
            },
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.1),
                  child: SizedBox(
                      child: Text(
                    "FAQ's",
                    style: TextStyle(fontSize: Get.width * 0.05),
                  )),
                ),
                SizedBox(width: Get.width * 0.6),
                SizedBox(
                    width: Get.width * 0.03,
                    height: Get.height * 0.05,
                    child:
                        const ImageIcon(AssetImage('assets/images/arrow.png'))),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 5, // Space above the line
            thickness: 0.1, // Line thickness
            indent: 40, // Space before the line starts
            endIndent: 42, // Space after the line ends
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(NamedRoutes.complaint);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.1),
                  child: SizedBox(
                      child: Text(
                    "Register a complaint",
                    style: TextStyle(fontSize: Get.width * 0.05),
                  )),
                ),
                SizedBox(width: Get.width * 0.26),
                SizedBox(
                    width: Get.width * 0.03,
                    height: Get.height * 0.05,
                    child:
                        const ImageIcon(AssetImage('assets/images/arrow.png'))),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 5, // Space above the line
            thickness: 0.1, // Line thickness
            indent: 40, // Space before the line starts
            endIndent: 42, // Space after the line ends
          ),
        ],
      ),
    );
  }
}
