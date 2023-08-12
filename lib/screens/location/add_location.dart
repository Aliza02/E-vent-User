import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class addLocation extends StatelessWidget {
  const addLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TextAppBar(title: 'Add Location'),
      body: Column(
       
        children: [
          Container(
            margin: EdgeInsets.only(right: 200),
      width: 146,
      height: 30,
      
          child:Text("Add Another Location",style: TextStyle(fontSize: 22),),
      
          
        ),
        SizedBox(height: 5,),
        Expanded(
          flex: 1,
          
          child: ListView(
            children:const [
              ListTile(
                leading: Icon(Icons.not_listed_location_rounded,size: 50,),
                title: Text('House# 12/98 XYZ Building, Latifabad Hyd.',style: TextStyle(fontSize: 18,),),
               
              ),
              
            ],
          ),
        ),
        
        Container(
          width: 100,
          height:30,
          margin: EdgeInsets.fromLTRB(200, 0, 0, 470),
child: Button(label: "Add", onPressed: (){}),

        ),

       
        ]
      ),
    
      
      );
      
  }
}