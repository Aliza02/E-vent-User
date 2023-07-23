import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/message_model.dart';
import 'message_controller.dart';

class ButtonController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final MessageController _msgController = Get.find<MessageController>();

  RxBool isExpanded = false.obs;
  RxBool isCatBtnToggled = true.obs;
  RxBool isViewMoreToggled = false.obs;
  RxBool isCustomBtnToggled = false.obs;
  AnimationController? animationController;
  late Animation<double> animation;
  TextEditingController offerAmountEditingController = TextEditingController();
  TextEditingController offerDetailsEditingController = TextEditingController();
  RxInt selectedButtonIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeInOut,
    );
    offerAmountEditingController.text = '45000';
    updateAmount(offerAmountEditingController.text, selectedButtonIndex.value);

    // Dispose the controller when it is no longer needed
    // (You can also use `onClose` instead of `dispose` in newer versions of GetX)
    ever(isExpanded, (bool expanded) {
      if (!expanded) {
        animationController!.reverse();
      }
    });
  }

  void sendOffer() {
    _msgController.addMessage(
      MessageModel(
        msg: 'First Offer',
        toID: "user1",
        read: "false",
        type: MsgType.offer,
        fromID: "user2",
        sent: "1681932499129",
      ),
    );
    toggleContainer();
    toggleOffer();
  }

  void toggleViewMore() {
    isViewMoreToggled.toggle();
  }

  void toggleOffer() {
    isCatBtnToggled.toggle();
    isCustomBtnToggled.toggle();
  }

  String viewMoreLessText() {
    return isViewMoreToggled.value ? 'View less' : 'View more';
  }

  void toggleCustom() {
    isCustomBtnToggled.toggle();
    isCatBtnToggled.toggle();
  }

  void toggleContainer() {
    isExpanded.toggle();
    if (isExpanded.value) {
      animationController!.forward();
    } else {
      animationController!.reverse();
    }
  }

  void updateAmount(String amount, int index) {
    offerAmountEditingController.text = amount;
    selectedButtonIndex.value = index;
  }

  @override
  void dispose() {
    animationController?.dispose();
    offerAmountEditingController.dispose();
    offerDetailsEditingController.dispose();
    super.dispose();
  }
}
