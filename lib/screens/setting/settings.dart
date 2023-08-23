// import 'package:eventually_user/widget/text_appbar.dart';
// import 'package:flutter/material.dart';

// class Settings extends StatelessWidget {
//   const Settings({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const TextAppBar(title: 'Setting'),
//       body: SizedBox(
//         child: Column(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(3),
//                     width: 120,
//                     height: 120,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: const LinearGradient(
//                         colors: [
//                           Color.fromARGB(255, 130, 186, 233),
//                           Colors.purple
//                         ],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                       border: Border.all(
//                         color: Colors.red,

//                         width: 2, // Border width
//                       ),
//                     ),
//                     child: const CircleAvatar(
//                       backgroundImage: AssetImage('assets/images/pic.png'),
//                     ),
//                   ),
//                   const Text(
//                     "Ali Khan",
//                   ),
//                   const Text("alikhan2@gmail.com",
//                       style: TextStyle(
//                         fontSize: 12,
//                       )),
//                 ],
//               ),
//               const Divider(
//                 color: Colors.black,
//                 height: 50, // Space above the line
//                 thickness: 0.2, // Line thickness
//                 indent: 20, // Space before the line starts
//                 endIndent: 20, // Space after the line ends
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
//                 child: const Row(children: [
//                   ImageIcon(AssetImage('assets/images/Vector.png')),
//                   // Image(image: AssetImage('images/Vector.jpg'),),
//                   // Icon(Icons.key),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text("Account")
//                 ]),
//               ),
//               const Divider(
//                 color: Colors.black,
//                 height: 50, // Space above the line
//                 thickness: 0.2, // Line thickness
//                 indent: 20, // Space before the line starts
//                 endIndent: 20, // Space after the line ends
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
//                 child: const Row(children: [
//                   ImageIcon(AssetImage('assets/images/notification.png')),
//                   // Icon(Icons.notifications),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text("Notificatoin")
//                 ]),
//               ),
//               const Divider(
//                 color: Colors.black,
//                 height: 50, // Space above the line
//                 thickness: 0.2, // Line thickness
//                 indent: 20, // Space before the line starts
//                 endIndent: 20, // Space after the line ends
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
//                 child: const Row(children: [
//                   ImageIcon(AssetImage('assets/images/Group.png')),
//                   // Icon(Icons.lock),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text("Privacy Policy")
//                 ]),
//               ),
//               const Divider(
//                 color: Colors.black,
//                 height: 50, // Space above the line
//                 thickness: 0.2, // Line thickness
//                 indent: 20, // Space before the line starts
//                 endIndent: 20, // Space after the line ends
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
//                 child: const Row(children: [
//                   ImageIcon(AssetImage('assets/images/faq.png')),
//                   // Icon(Icons.format_quote),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text("FAQ's")
//                 ]),
//               ),
//               const Divider(
//                 color: Colors.black,
//                 height: 50, // Space above the line
//                 thickness: 0.2, // Line thickness
//                 indent: 20, // Space before the line starts
//                 endIndent: 20, // Space after the line ends
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
//                 child: const Row(children: [
//                   ImageIcon(AssetImage('assets/images/location.png')),
//                   // Icon(Icons.location_city),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text("Location")
//                 ]),
//               ),
//             ]),
//       ),
//     );
//   }
// }

import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
