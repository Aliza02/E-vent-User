import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';

class CustomStepper extends StatelessWidget {
  // final int stepNumber;
  final List stepTitle;
  // final bool isActive;

  const CustomStepper({
    super.key,
    required this.stepTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .08),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StepWidget(
                stepNumber: 1,
                stepTitle: stepTitle[0][0],
                isActive: stepTitle[0][1] ?? false,
              ),
              Expanded(
                child: Container(
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.22,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),
                    color: Colors.grey,
                  ),
                ),
              ),
              StepWidget(
                stepNumber: 2,
                stepTitle: stepTitle[1][0],
                isActive: stepTitle[1][1] ?? false,
              ),
              Expanded(
                child: Container(
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.22,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),
                    color: Colors.grey,
                  ),
                ),
              ),
              StepWidget(
                stepNumber: 3,
                stepTitle: stepTitle[2][0],
                isActive: stepTitle[2][1] ?? false,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * .15,
                child: Text(
                  stepTitle[0][0],
                  style: TextStyle(
                    color: stepTitle[0][1] ?? false
                        ? Color(constant.red)
                        : Colors.grey,
                    fontSize: 8,
                    fontFamily: constant.font,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * .15,
                child: Text(
                  stepTitle[1][0],
                  style: TextStyle(
                    color: stepTitle[1][1] ?? false
                        ? Color(constant.red)
                        : Colors.grey,
                    fontSize: 8,
                    fontFamily: constant.font,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * .15,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    stepTitle[2][0],
                    style: TextStyle(
                      color: stepTitle[2][1] ?? false
                          ? Color(constant.red)
                          : Colors.grey,
                      fontSize: 8,
                      fontFamily: constant.font,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StepWidget extends StatelessWidget {
  final int stepNumber;
  final String stepTitle;
  final bool isActive;

  const StepWidget({
    super.key,
    required this.stepNumber,
    required this.stepTitle,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 11,
      height: 11,
      decoration: ShapeDecoration(
        color: isActive
            ? Color(constant.red)
            : Colors.transparent, // Active and inactive step color
        shape: CircleBorder(
            side: BorderSide(color: Color(constant.red), width: 0.50)),
      ),
    );
  }
}
