import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';

class Complaint extends StatelessWidget {
  const Complaint({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: TextAppBar(title: "Help Center"),
body: Column(
children: [
  Center(child: Text("Register a Complaint",style: TextStyle(fontSize: 28,color: Colors.red),)),

  SizedBox(height: 30,),
SizedBox(
  height: 150,
  width: 260,
  child: TextField(
  
  
    decoration: InputDecoration(
  hintTextDirection: TextDirection.ltr,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      // hintText: 'Enter a search term',
      fillColor: const Color.fromARGB(255, 255, 255, 255),
      filled:true,
      hintMaxLines: 50,
      contentPadding: EdgeInsets.fromLTRB(120, 0, 0, 120)
      
  
    ),
  
  ),
  
),
  Padding(
    padding: const EdgeInsets.fromLTRB(160, 10, 0, 0),
    child: Container(
   width: 100,
            height:30,
            
      child: Button(
        
        label: "Submit", 
        onPressed: (){}),
    ),
  )
],

),
    );
  }
}
