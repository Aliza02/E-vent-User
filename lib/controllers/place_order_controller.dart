import 'package:flutter/material.dart';
import 'package:get/get.dart';

class placeOrderController extends GetxController {
  final RxList<String> serviceName = <String>[].obs;
  final RxList<String> servicePrice = <String>[].obs;
  final RxList<String> location = <String>[].obs;
  final RxList<String> noOfPerson = <String>[].obs;
  final RxList<String> vendorName = <String>[].obs;
  final RxList<DateTime> date = <DateTime>[].obs;
  // variable that enable cancel button on order placement
  final RxBool enableCancelOrderButton = false.obs;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();

  // variable to diable toggler button to select item on confirmation screen

  RxBool disableToggle = false.obs;

  // variable to display order number

  RxString orderNumber = ''.obs;

  // variable to showloading on bottom sheet of confirmation screen
  RxBool confirmOrder = false.obs;

  // date picker variables on bottomsheet when placing order from chat

  Rx<DateTime> selecteddate = DateTime.now().obs;
  RxInt month = 0.obs;
  RxInt year = 0.obs;

  final Rx<TimeOfDay> startTime = TimeOfDay.now().obs;
  final Rx<TimeOfDay> endTime = TimeOfDay.now().obs;
}
