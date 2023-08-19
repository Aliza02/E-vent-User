import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';

class CustomAmountButton extends StatelessWidget {
  final String amount;
  final int index;

  final RxInt selectedButtonIndex;
  final void Function(String, int) onPressed; // Updated type

  const CustomAmountButton({
    Key? key,
    required this.amount,
    required this.index,
    required this.selectedButtonIndex,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onPressed(amount, index),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: selectedButtonIndex.value == index
                  ? Colors.transparent
                  : Color(constant.blue),
            ),
          ),
          backgroundColor: selectedButtonIndex.value == index
              ? Color(constant.blue)
              : Colors.white,
        ),
        child: Text(
          amount,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: selectedButtonIndex.value == index
                ? Colors.white
                : Color(constant.blue),
          ),
        ),
      ),
    );
  }
}
