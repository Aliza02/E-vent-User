import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final String name;
  final String image;

  const CategoryBox({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: 120,
              height: 120,
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Manrope-Bold',
              fontSize: 14,
              //fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
