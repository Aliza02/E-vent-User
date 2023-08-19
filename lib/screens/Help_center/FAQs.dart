import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/material.dart';

class FAQs extends StatefulWidget {
  const FAQs({super.key});

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {

  bool _customIcon=false;

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold (
       appBar:  TextAppBar(title: 'Help'),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
              children:<Widget> [

                Text("FAQs",style: TextStyle(color: Color.fromRGBO(203, 88, 90, 1),fontSize: 28),),
          ExpansionTile(title: Text("How to place an order"),
          trailing: ImageIcon(_customIcon ? AssetImage("assets/images/down.png") : AssetImage("assets/images/arrow.png")
          ),
          children: <Widget>[
            ListTile(
              title:Text('Go to the product that you want to place an order for and press “ add to cart” if you don’t want any customization in either the product itself or it’s price. If you have any customization requests click on the “ chat with vendor “ option and negotiate your requirements with the vendor and make offers according to your budget and needs.'))
          ],
          onExpansionChanged: (bool expanded){
            setState(() =>_customIcon=expanded);
          },
         
          
          ),





            ExpansionTile(title: Text("How can I negotiate on a price?"),
         trailing: ImageIcon(_customIcon ? AssetImage("assets/images/down.png") : AssetImage("assets/images/arrow.png")
          ),
          children: <Widget>[
            ListTile(
              title:Text('Go to the product that you want to place an order for and press “ add to cart” if you don’t want any customization in either the product itself or it’s price. If you have any customization requests click on the “ chat with vendor “ option and negotiate your requirements with the vendor and make offers according to your budget and needs.'))
          ],
          onExpansionChanged: (bool expanded){
            setState(() =>_customIcon=expanded);
          },
          ),


            ExpansionTile(title: Text("How can i cancel my order?"),
       trailing: ImageIcon(_customIcon ? AssetImage("assets/images/down.png") : AssetImage("assets/images/arrow.png")
          ),
          children: <Widget>[
            ListTile(
              title:Text('Go to the product that you want to place an order for and press “ add to cart” if you don’t want any customization in either the product itself or it’s price. If you have any customization requests click on the “ chat with vendor “ option and negotiate your requirements with the vendor and make offers according to your budget and needs.'))
          ],
          onExpansionChanged: (bool expanded){
            setState(() =>_customIcon=expanded);
          },
          ),


            ExpansionTile(title: Text("What is the advance payment for?"),
           trailing: ImageIcon(_customIcon ? AssetImage("assets/images/down.png") : AssetImage("assets/images/arrow.png")
          ),
          children: <Widget>[
            ListTile(
              title:Text('Go to the product that you want to place an order for and press “ add to cart” if you don’t want any customization in either the product itself or it’s price. If you have any customization requests click on the “ chat with vendor “ option and negotiate your requirements with the vendor and make offers according to your budget and needs.'))
          ],
          onExpansionChanged: (bool expanded){
            setState(() =>_customIcon=expanded);
          },
          ),


          
            ExpansionTile(title: Text("How does the payment method works?"),
      trailing: ImageIcon(_customIcon ? AssetImage("assets/images/down.png") : AssetImage("assets/images/arrow.png")
          ),
          children: <Widget>[
            ListTile(
              title:Text('Go to the product that you want to place an order for and press “ add to cart” if you don’t want any customization in either the product itself or it’s price. If you have any customization requests click on the “ chat with vendor “ option and negotiate your requirements with the vendor and make offers according to your budget and needs.'))
          ],
          onExpansionChanged: (bool expanded){
            setState(() =>_customIcon=expanded);
          },
          ),

          
            ExpansionTile(title: Text("What is “Make an offer” ?"),
          trailing: ImageIcon(_customIcon ? AssetImage("assets/images/down.png") : AssetImage("assets/images/arrow.png")
          ),
          children: <Widget>[
            ListTile(
              title:Text('Go to the product that you want to place an order for and press “ add to cart” if you don’t want any customization in either the product itself or it’s price. If you have any customization requests click on the “ chat with vendor “ option and negotiate your requirements with the vendor and make offers according to your budget and needs.'))
          ],
          onExpansionChanged: (bool expanded){
            setState(() =>_customIcon=expanded);
          },
          ),
              
              ],
          ),
        ),
      ),
    );
  }
}