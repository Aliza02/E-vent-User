import 'package:eventually_user/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatefulWidget {
  String label;
  Button({super.key, required this.label});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: () {
        Get.toNamed('/homepage');
      },
      /*onPressed: () {
        String? currentRoute = ModalRoute.of(context)?.settings.name;

        if (currentRoute == '/homepage') {
          Get.toNamed('/homepage');
        } else if (currentRoute == '/login') {
          Get.toNamed('/login');
        } else {
          // Handle any other cases or just do nothing
        }
      },*/

      // onPressed: () {
      //   if (GetUtils.isEmail(Get.find<TextEditingController>().text)) {
      //     storage.write('email', emailController.text);
      //   } else {
      //     Get.snackbar(
      //         'Error writing', 'email provided was invalid',
      //         snackPosition: SnackPosition.BOTTOM);
      //   }
      // },
      child: Text(widget.label,
          style: TextStyle(
            fontFamily: constant.font,
            fontWeight: FontWeight.w600,
            fontSize: width * 0.04,
            color: Colors.white,
          )),
      style: ElevatedButton.styleFrom(
        elevation: 10.0,
        shadowColor: Color(0xFFCB585A).withOpacity(0.4),
        backgroundColor: Color(0xFFCB585A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
