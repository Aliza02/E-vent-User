import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        margin: EdgeInsets.only(left: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [ 
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 41, 130, 0),
                child: Container(
                  
                  width:195,
                  height: 41,
                  child: Text("Notifications",style: TextStyle(
                    fontSize: 30,fontWeight: FontWeight.w800
                  ),)),
              ),
           
          
            SizedBox(height: 20,),
      
      Container(
        margin: EdgeInsets.only(right: 280),
        width: 40,
        height: 19,
        child: Text("Today",style: TextStyle(fontSize: 14),),
      
        
      ),
      
       
      
      
      
             Card(
              shadowColor: const Color.fromARGB(255, 184, 178, 178),
              elevation: 10,
      
              margin: EdgeInsets.only(left: 5),
                
                  child: Container(
                    width: 380,
                    height: 100,
                    child: Column(
                     children: [
                      
                                Padding(
                                   padding: const EdgeInsets.fromLTRB(0, 30, 180, 0),
                                  child: Container(
                                    
                                  width: 153,
                                  height: 25,
                                  child: Text("Order Confirmed!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                                                              
                                  ),
                                ),
                     Padding(
                                                    padding: const EdgeInsets.only(right: 65),
      
                       child: Container(
                        
                                  width: 265,
                                  height: 13,
                                  child: Text("Your order just got confirmed. Happy booking!",style: TextStyle(fontSize: 9.36,fontWeight: FontWeight.w700),),
                                
                                  ),
                     )
                     ],
                    ),
                  ),
                  // borderRadius: BorderRadius.all(Radius.circular(20)),
                 
                  ),
             
         
             SizedBox(height: 20,),
             Container(
              margin: EdgeInsets.only(left: 320),
         width: 66,
         height: 16,
          
           child: Text(
            "12:15 pm", style: TextStyle(fontSize: 12,color:  Color.fromRGBO(138, 144, 153, 1),),
           ),
          ),
      
        
      
      
           
      
      Container(
        margin: EdgeInsets.only(right: 260),
        width: 70,
        height: 19,
        child: Text("Yesterday",style: TextStyle(fontSize: 14),),
      
        
      ),
      
       
      
      
      
             Card(
              shadowColor: const Color.fromARGB(255, 184, 178, 178),
              elevation: 10,
      
              margin: EdgeInsets.only(left: 5),
                
                  child: Container(
                    width: 380,
                    height: 100,
                    child: Column(
                     children: [
                      
                                Padding(
                                   padding: const EdgeInsets.fromLTRB(0, 30, 180, 0),
                                  child: Container(
                                    
                                  width: 162,
                                  height: 24,
                                  child: Text("Response Pending",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                                                              
                                  ),
                                ),
                     Padding(
                                                    padding: const EdgeInsets.only(right: 65),
      
                       child: Container(
                        
                                  width: 265,
                                  height: 26,
                                  child: Text("You have some un-answered chats. Don’t miss out on something important.",style: TextStyle(fontSize: 9.36,fontWeight: FontWeight.w700),),
                                
                                  ),
                     )
                     ],
                    ),
                  ),
                  // borderRadius: BorderRadius.all(Radius.circular(20)),
                 
                  ),
             
         
             SizedBox(height: 20,),
             Container(
              margin: EdgeInsets.only(left: 310),
         width: 46,
         height: 16,
          
           child: Text(
            "5:00 pm", style: TextStyle(fontSize: 12,color:  Color.fromRGBO(138, 144, 153, 1),),
           ),
          ),
      
      
      
      
       
      
      
      
             Card(
              shadowColor: const Color.fromARGB(255, 184, 178, 178),
              elevation: 10,
      
              margin: EdgeInsets.only(left: 5),
                
                  child: Container(
                    width: 380,
                    height: 100,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Container(
                                            width: 50, 
                                            height: 50,
                                            child:Image(image: AssetImage("assets/images/evantually.png"),)
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          child: Column(
                           children: [
                            
                                      Padding(
                                         padding: const EdgeInsets.fromLTRB(0, 30, 60, 0),
                                        child: Container(
                                          
                                        width: 206,
                                        height: 25,
                                        child: Text("Welcome to EventuAlly!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                                                                    
                                        ),
                                      ),
                           Padding(
                                                          padding: const EdgeInsets.only(right: 0),
                        
                             child: Container(
                              
                                        width: 265,
                                        height: 26,
                                        child: Text("Welcome! Start using EventuAlly and find the right service from the right vendor",style: TextStyle(fontSize: 9.36,fontWeight: FontWeight.w700),),
                                      
                                        ),
                           )
                           ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // borderRadius: BorderRadius.all(Radius.circular(20)),
                 
                  ),
             
         
             SizedBox(height: 20,),
             Container(
              margin: EdgeInsets.only(left: 310),
         width: 46,
         height: 16,
          
           child: Text(
            "4:00 pm", style: TextStyle(fontSize: 12,color:  Color.fromRGBO(138, 144, 153, 1),),
           ),
          ),
      
      
      
            
            ]),
      ),
    );
  }
}




