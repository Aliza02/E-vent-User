import 'package:flutter/material.dart';

import '../../../constants/constant.dart';

class OfferNCustomTexts extends StatelessWidget {
  const OfferNCustomTexts({
    super.key,
    required this.title,
    required this.package,
  });
  final String title;
  final String package;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(constant.grey),
            ),
          ),
          Text(
            package,
            style: TextStyle(
              color: Color(constant.red),
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
