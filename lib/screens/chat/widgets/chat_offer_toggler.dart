import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';
import '../../../controllers/offer_btn_controller.dart';
import 'chat_offer_btn.dart';
import 'chat_offer_container.dart';

class OfferToggler extends StatelessWidget {
  OfferToggler({
    super.key,
  });
  final ButtonController _buttonController = Get.find<ButtonController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Obx(
          () => !_buttonController.isExpanded.value
              ? GestureDetector(
                  onTap: _buttonController.toggleContainer,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * .02),
                    width: Get.width * .4,
                    height: Get.height * .08,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(constant.blue)),
                      color: Color(constant.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/make_offer_unselected.svg',
                        ),
                        const Spacer(),
                        Text(
                          'Make an offer',
                          style: TextStyle(color: Color(constant.blue)),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                )
              : const SizedBox(height: 16),
        ),
        Obx(
          () => SizeTransition(
            sizeFactor: _buttonController.isExpanded.value
                ? CurvedAnimation(
                    parent: _buttonController.animationController!,
                    curve: Curves.easeInOut,
                  )
                // : const AlwaysStoppedAnimation<double>(0),
                : CurvedAnimation(
                    parent: _buttonController.animationController!,
                    curve: Curves.easeInOut,
                  ),
            child: Column(
              //!if we want to specify any color then do it above
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Get.width * .04),
                  padding: EdgeInsets.symmetric(vertical: Get.width * .02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * .02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomElevatedButton(
                          isToggled: _buttonController.isCatBtnToggled.value,
                          onPressed: _buttonController.toggleOffer,
                          asset: _buttonController.isCatBtnToggled.value
                              ? 'assets/icons/make_offer_selected.svg'
                              : 'assets/icons/make_offer_unselected.svg',
                          label: 'Make an offer',
                          buttonColor: Color(constant.blue),
                        ),
                        SizedBox(width: Get.width * .02),
                        CustomElevatedButton(
                          isToggled: _buttonController.isCustomBtnToggled.value,
                          onPressed: _buttonController.toggleCustom,
                          asset: _buttonController.isCustomBtnToggled.value
                              ? 'assets/icons/customize_offer_selected.svg'
                              : 'assets/icons/customize_offer_unselected.svg',
                          label: 'Customization Details',
                          buttonColor: Color(constant.red),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => _buttonController.isExpanded.value
                      ? _buttonController.isCatBtnToggled.value
                          ? ChatOfferContainer()
                          : ChatOfferContainer()
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
