import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/screens/Help_center/complaint_success.dart';
import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Complaint extends StatelessWidget {
  const Complaint({super.key});

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
          title: const Text('Help Center'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Center(
                child: Text(
              "Register a Complaint",
              style: TextStyle(fontSize: 28, color: AppColors.pink),
            )),
            const SizedBox(
              height: 30,
            ),
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
                  // controller: reviewController,
                  decoration: InputDecoration(
                    hintText: 'Write your complaint...',
                    hintStyle: TextStyle(
                      color: Color(constant.fieldTextHint),
                      fontSize: 16,
                      fontFamily: constant.font,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(160, 10, 0, 0),
              child: Container(
                width: 100,
                height: 30,
                child: Button(
                    label: "Submit",
                    onPressed: () {
                      Get.to(() => ComplainSuccess());
                      // FirebaseFirestore.instance.collection('Complaints')
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
