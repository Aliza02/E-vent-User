import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TextAppBar(title: 'Setting'),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
             
              
              children: [
                       Container(
                        
                        padding: EdgeInsets.all(3),
                        width: 120,
                        height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 130, 186, 233), Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
                  border: Border.all(
                    color: Colors.red,
                    
                    width: 2, // Border width
                  ),
                ),
                child:const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pic.png'),
                  ),
                
              ),
              const Text("Ali Khan",),
              const Text("alikhan2@gmail.com",style: TextStyle(fontSize: 12,  )),
         
              ],
             
             
            ),

             const Divider(
              
      color: Colors.black,
      height: 50,        // Space above the line
      thickness: 0.2,      // Line thickness
      indent: 20,        // Space before the line starts
      endIndent: 20,     // Space after the line ends
    ),



          Container(


            
            margin: EdgeInsets.fromLTRB(30, 0, 0,0),
            
            child :Row(children: [
              ImageIcon(AssetImage('assets/images/Vector.png')),
              // Image(image: AssetImage('images/Vector.jpg'),),
              // Icon(Icons.key),
              SizedBox(width: 10,),
              Text("Account")]),
          ),

       const Divider(
              
      color: Colors.black,
      height: 50,        // Space above the line
      thickness: 0.2,      // Line thickness
      indent: 20,        // Space before the line starts
      endIndent: 20,     // Space after the line ends
    ),

Container(
            margin: EdgeInsets.fromLTRB(30, 0, 0,0),
            
            child :Row(children: [
              ImageIcon(AssetImage('assets/images/notification.png')),
              // Icon(Icons.notifications),
              SizedBox(width: 10,),
              Text("Notificatoin")]),
          ),

           const Divider(
              
      color: Colors.black,
      height: 50,        // Space above the line
      thickness: 0.2,      // Line thickness
      indent: 20,        // Space before the line starts
      endIndent: 20,     // Space after the line ends
    ),

Container(
            margin: EdgeInsets.fromLTRB(30, 0, 0,0),
            
            child :Row(children: [
              ImageIcon(AssetImage('assets/images/Group.png')),
              // Icon(Icons.lock),
              SizedBox(width: 10,),
              Text("Privacy Policy")]),
          ),

const Divider(
              
      color: Colors.black,
      height: 50,        // Space above the line
      thickness: 0.2,      // Line thickness
      indent: 20,        // Space before the line starts
      endIndent: 20,     // Space after the line ends
    ),

Container(
            margin: EdgeInsets.fromLTRB(30, 0, 0,0),
            
            child :Row(children: [
              ImageIcon(AssetImage('assets/images/faq.png')),
              // Icon(Icons.format_quote),
              SizedBox(width: 10,),
              Text("FAQ's")]),
          ),
const Divider(
              
      color: Colors.black,
      height: 50,        // Space above the line
      thickness: 0.2,      // Line thickness
      indent: 20,        // Space before the line starts
      endIndent: 20,     // Space after the line ends
    ),


Container(
            margin: EdgeInsets.fromLTRB(30, 0, 0,0),
            
            child :Row(children: [
              ImageIcon(AssetImage('assets/images/location.png')),
              // Icon(Icons.location_city),
              SizedBox(width: 10,),
              Text("Location")]),
          ),


          ]
        ),
      ),
      
     
      
      );
      
  }
}

