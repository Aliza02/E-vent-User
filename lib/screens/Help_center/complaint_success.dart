
import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';

class ComplainSuccess extends StatelessWidget {
  const ComplainSuccess({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: TextAppBar(
  title: "Help Center",
  


),
body: Center(
  child:   Column(
  
  children: [
  
    Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Container(
      width: 186,
      height: 189,
        child: Image.asset("assets/images/girl.png"),),
    ),
      Padding(
        padding: const EdgeInsets.fromLTRB(45, 10, 0, 0),
        child: Container(
          alignment: Alignment.center,
          width: 296,
          height: 66,
          child: Text("     Your Complaint is Successfully registered",style: TextStyle(fontSize: 24,color: Color.fromRGBO(203, 88, 90, 1)
          ),
          
          )),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(30,0, 0, 0),
        child: Container(
          
          width: 324,
          height: 44,
          child: Text("Your complaint will be soon entertained by \n            EventuAlly’s help desk team.",style: TextStyle(fontSize: 16),)),
      )
  
  ],
  
  
  
  ),
),
    );
  }
}