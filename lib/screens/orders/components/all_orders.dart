import 'package:flutter/material.dart';

import 'order_card.dart';
import 'order_type_text_container.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int tAOrders = 3;
    int tPOrders = 3;
    int tCOrders = 3;
    int aStartingIndex = 0;
    int pStartingIndex = tAOrders;
    int cStartingIndex = tAOrders + tPOrders;

    return Expanded(
      child: ListView.builder(
          itemCount: tAOrders + tPOrders + tCOrders,
          itemBuilder: (context, index) {
            if (index < pStartingIndex) // starting of Active ORder
            {
              // Active Order Portion
              if (index == aStartingIndex) {
                return const Column(children: [
                  SizedBox(height: 10),
                  OrderTypeTextContainer(
                      text: 'Active orders', color: Colors.green),
                  OrderCard()
                ]);
              }
              return const OrderCard();
            } else if (index < cStartingIndex) // starting of Previous ORder
            {
              // Pending Order Portion
              if (index == pStartingIndex) {
                return const Column(children: [
                  SizedBox(height: 10),
                  OrderTypeTextContainer(
                      text: 'Previous orders', color: Color(0xFF555454)),
                  OrderCard()
                ]);
              }
              return const OrderCard();
            } else // starting of Cancelled ORder
            {
              // Cancel Order Portion
              if (index == cStartingIndex) {
                return const Column(children: [
                  SizedBox(height: 10),
                  OrderTypeTextContainer(
                      color: Color(0xFFDC0003), text: 'Cancelled orders'),
                  OrderCard()
                ]);
              }
              return const OrderCard();
            }
          }),
    );
  }
}
