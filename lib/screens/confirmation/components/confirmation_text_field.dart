import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';

class ConfirmationTextFieldRow extends StatelessWidget {
  const ConfirmationTextFieldRow({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * .15,
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
                  borderSide:
                      BorderSide(width: 0.40, color: Color(constant.red)),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.40,
                    color: Color(constant.red),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                hintText: title,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
