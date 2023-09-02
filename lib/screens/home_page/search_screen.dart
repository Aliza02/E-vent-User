import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/routes.dart';
import 'package:eventually_user/widget/vendor_card.dart';
import 'package:eventually_user/widget/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class search_screen extends StatefulWidget {
  // final String abc;
  const search_screen({super.key});

  @override
  State<search_screen> createState() => _search_screenState();
}

class _search_screenState extends State<search_screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;
    print(argument);
    // final CollectionReference abc =
    //     FirebaseFirestore.instance.collection('User');
    final CollectionReference user =
        FirebaseFirestore.instance.collection('User');
    // .where('name', isEqualTo: 'Aliza');
    Map<String, dynamic> data;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Get.back();
              // ZoomDrawer.of(context)?.toggle();
              print('asda');
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Constant.pink,
              size: Get.width * 0.07,
              weight: Get.width * 0.1,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Get.toNamed(NamedRoutes.order);
              },
              icon: const Icon(
                Icons.notifications,
                color: Color(0xFFCB585A),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const Searchbar(),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(
                        left: Get.width * 0.07,
                        top: Get.height * 0.02,
                      ),
                      child: const Text(
                        'Categories',
                        style: TextStyle(
                            fontFamily: 'Manrope-ExtraBold',
                            fontWeight: FontWeight.bold,
                            fontSize:
                                22), //Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('User')
                            .where('Business Category', isEqualTo: argument)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                //(singleChildScrollable is already being used so disallow listview builder to scroll)
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot document =
                                      snapshot.data!.docs[index];
                                  //  final shhot= FirebaseFirestore.instance.collection('User').where('Business Category',isEqualTo:'Photographer').get();

                                  // data = document.data() as Map<String, dynamic>;
                                  // shhot.then((value) => print(value.docs[0].data()));

                                  // return GestureDetector(
                                  //   onTap: () {},
                                  //   child: VendorCard(vendors: vendors[index]),
                                  // );
                                  return VendorCard(
                                    vendorBusinessName:
                                        document['Business Name'],
                                    vendorBusinessLocation:
                                        document['Business Location'],
                                  );
                                });
                          } else {
                            return Container();
                          }
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
