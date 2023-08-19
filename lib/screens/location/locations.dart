import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';

class Locations extends StatelessWidget {
  const Locations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TextAppBar(title: 'Add Location'),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(right: 110),
          child: const Text(
            "Add Another Location",
            style: TextStyle(fontSize: 22),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          flex: 1,
          child: ListView(
            children: const [
              ListTile(
                leading: ImageIcon(
                  AssetImage(
                    'assets/images/layer1.png',
                  ),
                  size: 50,
                ),
                // Icon(Icons.not_listed_location_rounded,size: 50,),
                title: Text(
                  'House# 12/98 XYZ Building, Latifabad Hyd.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 100,
          height: 30,
          margin: const EdgeInsets.fromLTRB(200, 0, 0, 500),
          child: Button(label: "Add", onPressed: () {}),
        ),
      ]),
    );
  }
}
