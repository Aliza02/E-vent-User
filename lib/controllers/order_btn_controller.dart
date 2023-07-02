import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant.dart';

class OrdersBtnController extends GetxController {
  Rx<Color> activeButtonColor = Colors.green.obs;
  Rx<Color> allButtonColor = Color(constant.red).obs;

  RxBool isFirstButtonActive = true.obs;

  void setActiveButtonColor() {
    activeButtonColor.value = Colors.green;
    allButtonColor.value = Colors.grey;
    isFirstButtonActive.value = true;
  }

  void setAllButtonColor() {
    activeButtonColor.value = Colors.grey;
    allButtonColor.value = Color(constant.red);
    isFirstButtonActive.value = false;
  }
}
