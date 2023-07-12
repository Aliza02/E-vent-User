import 'package:get/get.dart';

class ToggleButtonController extends GetxController {
  RxInt numItems = 0.obs;
  RxBool isToggled = false.obs;

  void toggle() {
    isToggled.value = !isToggled.value;
  }
}
