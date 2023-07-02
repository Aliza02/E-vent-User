import 'package:flutter/material.dart';

import '../../orders/orders_screen.dart';

class OrderDate extends StatelessWidget {
  const OrderDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: mq.width * .16,
          child: const Text(
            'Date',
            style: TextStyle(
              color: Color(0xFF555454),
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Expanded(
          child: Text(
            '21/05/2023',
            style: TextStyle(
              color: Color(0xFFCB585A),
              fontSize: 16,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
