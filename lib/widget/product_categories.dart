import 'package:flutter/material.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Biryani, Qorma, Kheer, Kabab, Gulab Jamun, Pulao, Chapati, Naan, Broast & Custard. Biryani, Qorma, Kheer, Kabab, Gulab Jamun, Pulao, Chapati, Naan, Broast & Custard.',

      // maxLines: 3,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: Color(0xFF555454),
        fontSize: 12,
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
