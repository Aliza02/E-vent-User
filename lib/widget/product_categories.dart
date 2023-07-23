import 'package:flutter/material.dart';

import '../constants/constant.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Biryani, Qorma, Kheer, Kabab, Gulab Jamun, Pulao, Chapati, Naan, Broast & Custard. Biryani, Qorma, Kheer, Kabab, Gulab Jamun, Pulao, Chapati, Naan, Broast & Custard.',

      // maxLines: 3,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: const Color(0xFF555454),
        fontSize: 12,
        fontFamily: constant.font,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
