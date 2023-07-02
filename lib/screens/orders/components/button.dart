import 'package:flutter/material.dart';

import '../orders_screen.dart';

class ListOrderButton extends StatelessWidget {
  const ListOrderButton({
    super.key,
    required this.onpressed,
    required this.color,
    required this.title,
  });
  final VoidCallback onpressed;
  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          elevation: 4,
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .06, vertical: mq.height * .03),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
        ),
      ),
    );
  }
}
