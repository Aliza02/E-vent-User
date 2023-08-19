import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';

class UpdateLocation extends StatelessWidget {
  const UpdateLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TextAppBar(title: 'Location'),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(right: 200),
          width: 146,
          height: 30,
          child: const Text(
            "Your Location",
            style: TextStyle(fontSize: 22),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: ListView(
            children: const [
              ListTile(
                leading: ImageIcon(
                  AssetImage('assets/images/layer1.png'),
                  size: 50,
                ),
                //  Icon(Icons.not_listed_location_rounded,size: 50,),
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
          margin: const EdgeInsets.fromLTRB(200, 0, 0, 40),
          child: Button(label: "Edit", onPressed: () {}),
        ),
        Expanded(
          child: ListView(
            children: const [
              ListTile(
                leading: ImageIcon(
                  AssetImage('assets/images/layer1.png'),
                  size: 50,
                ),
                //  Icon(Icons.not_listed_location_rounded,size: 50,),
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
          margin: const EdgeInsets.fromLTRB(200, 0, 0, 300),
          child: Button(label: "Edit", onPressed: () {}),
        ),
        Container(
          width: 180,
          height: 44,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Button(label: "Edit", onPressed: () {}),
        ),
      ]),
    );
  }
}
