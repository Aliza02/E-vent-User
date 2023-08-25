import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../widget/restuarant_card.dart';
class VendorDetailsScreen extends StatelessWidget {

  VendorDetailsScreen({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: /*Enter body content here...Text("hi")*/
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(restaurant.imageUrl, height: 200, fit: BoxFit.cover)),
            SizedBox(height: 20),
            Center(
              child: Text(
                restaurant.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100.40,
                  height: 44.10,
                  decoration: ShapeDecoration(
                    color: Color(0xFFCB585A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    shadows: [
                      BoxShadow(
                        //color: Color(0x7FCB585A),
                        blurRadius: 12,
                        offset: Offset(4, 1.54),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "About",
                      style: TextStyle(color: Colors.white),  // Ensure text color contrasts well with button color
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,  // Set to transparent to utilize Container's color
                      shadowColor: Colors.transparent,  // Set to transparent to utilize Container's shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 100.40,
                  height: 44.10,
                  decoration: ShapeDecoration(
                    color: Color(0xFFCB585A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    shadows: [
                      BoxShadow(
                        //color: Color(0x7FCB585A),
                        blurRadius: 12,
                        offset: Offset(4, 1.54),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Services",
                      style: TextStyle(color: Colors.white),  // Ensure text color contrasts well with button color
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,  // Set to transparent to utilize Container's color
                      shadowColor: Colors.transparent,  // Set to transparent to utilize Container's shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100.40,
                  height: 44.10,
                  decoration: ShapeDecoration(
                    color: Color(0xFFCB585A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    shadows: [
                      BoxShadow(
                        //color: Color(0x7FCB585A),
                        blurRadius: 12,
                        offset: Offset(4, 1.54),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Reviews",
                      style: TextStyle(color: Colors.white),  // Ensure text color contrasts well with button color
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,  // Set to transparent to utilize Container's color
                      shadowColor: Colors.transparent,  // Set to transparent to utilize Container's shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                )

              ],
            ),
            SizedBox(height: 20),
            Text(
              "Category:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(restaurant.name),
            SizedBox(height: 20),
            Text(
              "Location:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(restaurant.address),
            SizedBox(height: 20),
            Text(
              "Description:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation"),
          ],
        ),
      ),
    );
  }
}


