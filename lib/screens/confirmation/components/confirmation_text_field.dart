import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';

class ConfirmationTextFieldRow extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;

  const ConfirmationTextFieldRow({
    super.key,
    required this.title,
    required this.controller,
    required this.inputType,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * .2,
          child: Text(
            title,
            style: k8TextStyle,
          ),
        ),
        Expanded(
          child: SizedBox(
            // width: Get.width * .6,
            height: 34,
            child: TextFormField(
              keyboardType: inputType,
              controller: controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your $title';
                }
                return null;
              },
              style: k8TextStyle,
              decoration: InputDecoration(
                labelStyle: k8TextStyle,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(constant.red)),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(constant.red),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                hintText: title,
                hintStyle:
                    TextStyle(color: Colors.grey, fontSize: Get.width * 0.03),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
