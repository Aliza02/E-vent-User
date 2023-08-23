import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TextAppBar(title: 'Payment Method'),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [ 
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 70, 0),
              child: Container(
                
                width:246,
                height: 30,
                child: Text("Your Payment methods",style: TextStyle(
                  fontSize: 22,
                ),)),
            ),
            SizedBox(height:20),
           Center(
             child: Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                border: Border.all(
                  width: 1,
                color: Color.fromRGBO(203, 88, 90, 1)
                ),
                ),
               child: Row(
                children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 20),
                       child: Container(
                        width: 69.04,
                        height: 17,
                                
                        child: Image(image: AssetImage("assets/images/easypaisa.png"),),
                        ),
                     ),
                      SizedBox(width: 30,),
                     Text("**** **** **** 7869",style: TextStyle(fontSize: 16),)
               ],),

              
             ),
           ),
           SizedBox(height: 20,),
           Container(
            margin: EdgeInsets.only(left: 270),
       width: 100,
       height: 30,
          child: Button(
            label: "Edit", onPressed: (){}),
        ),
          SizedBox(height: 20,),


           Center(
             child: Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                border: Border.all(
                  width: 1,
                color: Color.fromRGBO(203, 88, 90, 1)
                ),
                ),
               child: Row(
                children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 20),
                       child: Container(
                        width: 35,
                        height: 17,
                                
                        child: Image(image: AssetImage("assets/images/debit.png"),),
                        
                        ),
                     ),
                      SizedBox(width: 64,),
                     Text("**** **** **** 7869",style: TextStyle(fontSize: 16),)
               ],),

              
             ),
           ),
           SizedBox(height: 20,),
           Container(
            margin: EdgeInsets.only(left: 270),
       width: 100,
       height: 30,
          child: Button(
            label: "Edit", onPressed: (){}),
        ),

         Padding(
           padding: const EdgeInsets.fromLTRB(0, 220, 0, 0),
           child: Container(
              
                width: 180,
                height: 44,
            child: Button(
              label: "Add Another", onPressed: (){}),
                 ),
         ),

          
          ]),
    );
  }
}
