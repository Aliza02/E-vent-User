import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/controllers/homepage_controller.dart';
import 'package:eventually_user/controllers/vendor_detail_controller.dart';
import 'package:eventually_user/routes.dart';
import 'package:eventually_user/screens/home_page/vendor_page.dart';
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
  final vendorController = Get.put(vendorDetailController());
  final homePageController = Get.put(homepage_controller());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var argument = Get.arguments;
    var businessCategory = argument;

    print(businessCategory);
    // final CollectionReference abc =
    //     FirebaseFirestore.instance.collection('User');

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
                            .where('Business Category',
                                isEqualTo:
                                    homePageController.businessCategory.value)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            late DocumentSnapshot document;
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                //(singleChildScrollable is already being used so disallow listview builder to scroll)
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  document = snapshot.data!.docs[index];

                                  return GestureDetector(
                                    onTap: () async {
                                      int selected = index;
                                      document = snapshot.data!.docs[selected];
                                      print("click");
                                      vendorController.userId
                                          .add(document['userId']);
                                      await FirebaseFirestore.instance
                                          .collection('Services')
                                          .doc(document['Business Category'])
                                          .collection(document['userId'])
                                          .get()
                                          .then((value) {
                                        value.docs.forEach((element) async {
                                          print(element.data());
                                          await FirebaseFirestore.instance
                                              .collection('Services')
                                              .doc(
                                                  document['Business Category'])
                                              .collection(document['userId'])
                                              .doc(element.id)
                                              .get()
                                              .then((value) {
                                            vendorController.serviceName
                                                .add(value['Service Name']);
                                            vendorController.servicePrice
                                                .add(value['Service Price']);
                                            vendorController.noOfPerson
                                                .add(value['NoOfPerson']);
                                            vendorController.serviceDescription
                                                .add(value[
                                                    'Service Description']);
                                            vendorController.serviceImages
                                                .add(value['image1']);
                                            vendorController.serviceImages
                                                .add(value['image2']);
                                            vendorController.serviceImages
                                                .add(value['image3']);
                                          });
                                        });
                                      });

                                      print('added');

                                      Get.to(
                                        () => VendorDetailsScreen(),
                                        arguments: [
                                          document['Business Name'],
                                          document['Business Category'],
                                          document['userId'],
                                          document['Business Location'],
                                        ],
                                      );
                                    },
                                    child: VendorCard(
                                      vendorBusinessName:
                                          document['Business Name'],
                                      vendorBusinessLocation:
                                          document['Business Location'],
                                    ),
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
