import 'package:eventually_user/controllers/place_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/constant.dart';

class DurationButton extends StatelessWidget {
  final placeorderController = Get.put(placeOrderController());
  final String imagePath;
  final String buttonText;
  final Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);

  DurationButton({
    super.key,
    required this.imagePath,
    required this.buttonText,
  });
  int indexOfOrder = 0;
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      selectedTime.value = pickedTime;

      String selTime = '${pickedTime.hour}:${pickedTime.minute}:00';
      placeorderController.timeOfOrder
          .add(DateFormat.jm().format(DateFormat("hh:mm:ss").parse(selTime)));

      print(placeorderController.timeOfOrder[indexOfOrder]);
      indexOfOrder++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.0,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(constant.red),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: shadowsBelow,
        ),
        child: InkWell(
          onTap: () => _selectTime(context),
          child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(imagePath),
                  Text(
                    selectedTime.value != null
                        ? selectedTime.value!.format(context)
                        : buttonText,
                    style: TextStyle(
                      color: const Color(0xFF575A66),
                      fontSize: 14,
                      fontFamily: constant.font,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Color(constant.red),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
