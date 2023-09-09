import 'package:eventually_user/controllers/homepage_controller.dart';
import 'package:eventually_user/controllers/vendor_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final vendorController = Get.put(vendorDetailController());
  final homePageController = Get.put(homepage_controller());
  final RxInt peopleCount = 0.obs;
  final RxString priceRange = ''.obs;
  final TextEditingController location = TextEditingController();

  void increasePeopleCount() {
    if (priceRange.value.contains('-')) {
      List<String> parts = priceRange.split('-');

      if (parts.length == 2) {
        print(peopleCount.value);
        try {
          if (parts[0].length == 6 &&
              parts[1].length == 6 &&
              (homePageController.businessCategory.value == 'Venue' ||
                  homePageController.businessCategory.value == 'Caterers')) {
            int start = int.parse(parts[0]);
            int end = int.parse(parts[1]);
            print(peopleCount.value);
            peopleCount.value += 100;
            print(peopleCount.value);

            start += 10000;
            end += 10000;
            priceRange.value = "$start-$end";
          } else if (parts[0].length == 5 && parts[1].length == 5) {
            int start = int.parse(parts[0]);
            int end = int.parse(parts[1]);

            start += 1000;
            end += 1000;
            priceRange.value = "$start-$end";
          } else if (parts[0] == 4 && parts[1] == 4) {
            int start = int.parse(parts[0]);
            int end = int.parse(parts[1]);

            start += 100;
            end += 100;
            priceRange.value = "$start-$end";
          } else {
            int start = int.parse(parts[0]);
            int end = int.parse(parts[1]);

            start += 500;
            end += 500;
            priceRange.value = "$start-$end";
          }
        } catch (e) {}
      }
    } else if (priceRange.value.length == 6) {
      int addIntoPrice = int.parse(priceRange.value);
      addIntoPrice += 10000;
      peopleCount.value += 100;
      print(peopleCount.value);
      priceRange.value = "$addIntoPrice";
    } else {
      int abc = int.parse(priceRange.value);
      abc += 500;
      peopleCount.value += 50;
      priceRange.value = "$abc";
    }

    // if (peopleCount >= 400) {
    //   peopleCount.value += 50;
    // } else {}
  }

  void decreasePeopleCount() {
    if (peopleCount.value > 0) {
      peopleCount.value--;
    }
  }
}
