import 'package:flutter/material.dart';
import 'package:get/get.dart';

class placeOrderController extends GetxController {
  final RxList<String> serviceName = <String>[].obs;
  final RxList<String> servicePrice = <String>[].obs;
  final RxList<String> location = <String>[].obs;
  final RxList<String> noOfPerson = <String>[].obs;
  final RxList<String> vendorName = <String>[].obs;
  final RxList<DateTime> date = <DateTime>[].obs;
  final RxBool cartEnable = false.obs;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();
}
