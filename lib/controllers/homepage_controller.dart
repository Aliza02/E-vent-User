import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homepage_controller extends GetxController {
  final TextEditingController searchController = TextEditingController();

  final RxBool showSuggestion = false.obs;
  final RxInt count = 0.obs;

  final RxString businessCategory = ''.obs;
  final RxString businessName = ''.obs;
}
