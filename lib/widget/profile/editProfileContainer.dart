import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/controllers/firebaseController.dart';
import 'package:eventually_user/widget/profile/dialogButton.dart';
import 'package:eventually_user/widget/profile/personalInfo.dart';
import 'package:eventually_user/widget/profile/profileText.dart';
import 'package:eventually_user/widget/profile/personalInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../firebasemethods/userAuthentication.dart';

class editProfileContainer extends StatelessWidget {
  final String title;
  final String icon;
  final double opacity;
  final String collectionName;
  final String field;

  const editProfileContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.opacity,
    required this.collectionName,
    required this.field,
  });

  @override
  Widget build(BuildContext context) {
    final firebasecontroller = Get.put(firebaseController());
    final mycontroller = TextEditingController();
    
    return InkWell(
      onTap: () {
        Get.dialog(
          transitionCurve: const ElasticInCurve(0.4),
          transitionDuration: const Duration(milliseconds: 800),
          AlertDialog(
            shadowColor: AppColors.pink,
            actionsAlignment: MainAxisAlignment.center,
            title: profileText(
              title: "Update $field",
              fontColor: AppColors.pink,
              fontSize: Get.width * 0.04,
              fontWeight: AppFonts.bold,
            ),
            content: TextFormField(
              controller: mycontroller,
              cursorColor: AppColors.pink,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
                  borderSide: const BorderSide(
                    color: AppColors.pink,
                    width: 1.3,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
                  borderSide: const BorderSide(
                    color: AppColors.pink,
                    width: 1.3,
                  ),
                ),
                hintText: 'Enter new value',
              ),
            ),
            actions: [
              dialogButton(
                buttonTitle: 'Update',
                 buttonColor: AppColors.blue,
                onpressed: () async {
                  if (field == 'name') {
                    User? user = auth.currentUser;

                    user!.updateDisplayName(mycontroller.text);

                    await  FirebaseFirestore.instance
                        .collection(collectionName)
                        .doc(auth.currentUser!.uid)
                        .update({field: mycontroller.text}).then((value) => {
                              Get.back(),
                              firebasecontroller.userName.value =
                                  mycontroller.text,
                            });
                            print(auth.currentUser!.displayName!.toString());
                  } else if (field == 'Phone') {
                    await  FirebaseFirestore.instance
                        .collection(collectionName)
                        .doc(auth.currentUser!.uid)
                        .update({field: mycontroller.text}).then((value) => {
                              Get.back(),
                              firebasecontroller.phone.value =
                                  mycontroller.text,
                            });
                  }  else {
                    await FirebaseFirestore.instance
                        .collection(collectionName)
                        .doc(auth.currentUser!.uid)
                        .update({field: mycontroller.text}).then((value) => {
                              Get.back(),
                              firebasecontroller.businessCategory.value =
                                  mycontroller.text,
                            });
                  }
                  mycontroller.clear();
                },
              ),
              dialogButton(
                buttonTitle: 'Cancel',
                buttonColor: AppColors.pink,
                onpressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
      child: Container(
        height: Get.height * 0.08,
        margin: EdgeInsets.only(
          top: Get.height * 0.01,
        ),
        padding: const EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.pink.withOpacity(0.5),
            ),
            top: BorderSide(
              color: AppColors.pink.withOpacity(opacity),
            ),
          ),
        ),
        child: personalInfo(
          textTitle: title,
          fontSize: Get.width * 0.04,
          icon: icon,
          height: Get.height * 0.02,
        ),
      ),
    );
  }
}
