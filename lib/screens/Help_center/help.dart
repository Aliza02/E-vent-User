import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text('Help Center'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "How can we help?",
              style: TextStyle(
                  color: Color.fromRGBO(203, 88, 90, 1), fontSize: 28),
            ),
          )),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Container(
                    child: Text(
                  "FAQ's",
                  style: TextStyle(fontSize: 18),
                )),
              ),
              SizedBox(width: Get.width * 0.6),
              Container(
                  width: 10.12,
                  height: 18,
                  child: ImageIcon(AssetImage('assets/images/arrow.png'))),
            ],
          ),
          Divider(
            color: Colors.black,
            height: 5, // Space above the line
            thickness: 0.1, // Line thickness
            indent: 40, // Space before the line starts
            endIndent: 42, // Space after the line ends
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Container(
                    child: Text(
                  "Register a complaint",
                  style: TextStyle(fontSize: 18),
                )),
              ),
              SizedBox(width: Get.width * 0.4),
              Container(
                  width: 10.12,
                  height: 18,
                  child: ImageIcon(AssetImage('assets/images/arrow.png'))),
            ],
          ),
          Divider(
            color: Colors.black,
            height: 5, // Space above the line
            thickness: 0.1, // Line thickness
            indent: 40, // Space before the line starts
            endIndent: 42, // Space after the line ends
          ),
        ],
      ),
    );
  }
}
