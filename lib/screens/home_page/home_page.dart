import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/controllers/firebaseController.dart';
import 'package:eventually_user/controllers/homepage_controller.dart';
import 'package:eventually_user/controllers/message_controller.dart';
import 'package:eventually_user/controllers/order_btn_controller.dart';
import 'package:eventually_user/controllers/place_order_controller.dart';
import 'package:eventually_user/routes.dart';
import 'package:eventually_user/screens/home_page/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../firebasemethods/userAuthentication.dart';
import '../../widget/all_widgets.dart';
import '../../widget/vendor_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final firebasecontroller = Get.put(firebaseController());
  // late Restaurant restaurant;
  final List<CategoryBox> categories = [
    const CategoryBox(
        image: 'assets/images/photographer.jpg', name: 'Photographer'),
    const CategoryBox(image: 'assets/images/venues.jpg', name: 'Venue'),
    const CategoryBox(image: 'assets/images/caterers.jpg', name: 'Caterers'),
    // Add more categories here...
  ];

  late List<String> userId = [];

  List<String> vendor = ['Ab photographer', 'Shadi Qila', 'Al Aziz Caterers'];
  List<String> location = ['Latifabad', 'Qasimabad', 'Hirabad'];

  final msgController = Get.put(MessageController());
  final orderBtnController = Get.put(OrdersBtnController());

  void getResult() async {
    await FirebaseFirestore.instance.collection('messages').get().then((value) {
      value.docs.forEach((element) {
        if (element.id.contains(auth.currentUser!.uid)) {
          List<String> parts = element.id.split(auth.currentUser!.uid);
          print(parts);
          if (parts[0].isEmpty) {
            print('oo');
            print(element.id);
            msgController.chatUserId.add(parts[1]);
          } else {
            print('p');
            print('qq');

            msgController.chatUserId.add(parts[0]);
          }
        }
      });
    });

    // booking id
    await FirebaseFirestore.instance.collection('Orders').get().then((value) {
      orderBtnController.userIdToGetOrders.clear();
      value.docs.forEach((element) {
        print(element.id);

        if (element.id.contains(auth.currentUser!.uid)) {
          // print(element.id);
          orderBtnController.userIdToGetOrders.add(element.id);

          print(orderBtnController.userIdToGetOrders.length);
        }
      });
    });

    await FirebaseFirestore.instance.collection('User').get().then((value) {
      value.docs.forEach((element) {
        if (element.id.contains(auth.currentUser!.uid)) {
          firebasecontroller.userName.value = element.data()['name'];
          firebasecontroller.phone.value = element.data()['Phone'];
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    msgController.chatUserId.clear();
    print(msgController.chatUserId.length);
    getResult();
  }

  @override
  Widget build(BuildContext context) {
    final homePageController = Get.put(homepage_controller());
    final placeorderController = Get.put(placeOrderController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: Get.height * 0.07),
              child: Column(
                children: [
                  // Text(userId[0]),
                  //row containing Categories heading and see all button
                  const Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Categories',
                          style: TextStyle(
                              fontFamily: 'Manrope-ExtraBold',
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  22), //Theme.of(context).textTheme.headline4,
                        ),
                        // GestureDetector(
                        //   onTap: () {/*see all logic goes here*/},
                        //   child: const Text(
                        //     'See All',
                        //     style: TextStyle(
                        //       fontFamily: 'Manrope-Bold',
                        //       fontWeight: FontWeight.bold,
                        //       color: Color(0xFFCB585A),
                        //       fontSize: 12,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),

                  //categories shown below:
                  SizedBox(
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () async {
                                homePageController.businessCategory.value =
                                    categories[index].name;
                                Get.to(
                                  () => const search_screen(),
                                );
                              },
                              child: categories[index]);
                        },
                      )),

                  const Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Most Popular',
                          style: TextStyle(
                              fontFamily: 'Manrope-ExtraBold',
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  22), //Theme.of(context).textTheme.headline4,
                        ),
                        // GestureDetector(
                        //   onTap: () {/*see all logic goes here*/},
                        //   child: const Text(
                        //     'See All',
                        //     style: TextStyle(
                        //         fontFamily: 'Manrope-Bold',
                        //         fontWeight: FontWeight.bold,
                        //         color: Color(0xFFCB585A),
                        //         fontSize: 12),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed('/vendor_page');
                      Get.toNamed(NamedRoutes.vendorScreen);
                    },
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(), //(singleChildScrollable is already being used so disallow listview builder to scroll)
                        itemCount: location.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) =>
                              //       VendorDetailsScreen(restaurant: vendors[index]),
                              // ));
                            },
                            child: VendorCard(
                              vendorBusinessName: vendor[index],
                              vendorBusinessLocation: location[index],
                            ),
                          );
                          //return RestaurantCard(restaurant: restaurants[index]);
                        }),
                  ),
                ],
              ),
            ),

            const Searchbar(),
            // Obx(
            //   () => homePageController.showSuggestion.value == true
            //       ? buildSuggestionList(BuildContext, context)

            // ? SingleChildScrollView(
            //     scrollDirection: Axis.vertical,
            //     child: Center(
            //       child: Container(
            //         margin: EdgeInsets.only(
            //           top: Get.height * 0.07,
            //         ),
            //         width: Get.width * 0.85,
            //         decoration: BoxDecoration(
            //           color: AppColors.white,
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: ListView.builder(
            //           shrinkWrap: true,
            //           physics: const NeverScrollableScrollPhysics(),
            //           itemCount: filteredItems.length,
            //           itemBuilder: (context, index) {
            //             return GestureDetector(
            //               onTap: () {
            //                 homePageController.showSuggestion.value =
            //                     false;
            //                 print(
            //                     homePageController.showSuggestion.value);
            //               },
            //               child: ListTile(
            //                 title: Text(filteredItems[index]),
            //               ),
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //   )
            //       : SizedBox(),
            // ),
          ],
        ),
      ),
    );
  }
}
