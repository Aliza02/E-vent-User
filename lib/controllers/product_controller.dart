import 'package:get/get.dart';

class OrderController extends GetxController {
  final RxInt peopleCount = 100.obs;

  void increasePeopleCount() {
    peopleCount.value++;
  }

  void decreasePeopleCount() {
    if (peopleCount.value > 0) {
      peopleCount.value--;
    }
  }
}
