import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/screens/home_page/vendor_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes.dart';
import '../../widget/all_widgets.dart';
import '../../widget/restuarant_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CategoryBox> categories = [
    const CategoryBox(
        image: 'assets/images/photographer.jpg', name: 'Photographers'),
    const CategoryBox(image: 'assets/images/venues.jpg', name: 'Venue'),
    const CategoryBox(image: 'assets/images/caterers.jpg', name: 'Caterers'),
    // Add more categories here...
  ];

  late List<String> userId = [];

  Map<int, String> categoryMap = {
    0: 'Photographer',
    1: 'Venue',
    2: 'Caterers',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Searchbar(),
            //row containing Categories heading and see all button
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                        fontFamily: 'Manrope-ExtraBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 22), //Theme.of(context).textTheme.headline4,
                  ),
                  GestureDetector(
                    onTap: () {/*see all logic goes here*/},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                          fontFamily: 'Manrope-Bold',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFCB585A),
                          fontSize: 12),
                    ),
                  )
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
                          print('sda');
                          final categoryName = categoryMap[index];
                          print(categoryMap[index]);
                          print(categoryName);

                          await FirebaseFirestore.instance
                              .collection('User')
                              .where('Business Category',
                                  isEqualTo: categoryName)
                              .get()
                              .then((value) => {
                                    value.docs.forEach((element) {
                                      print(element.data());
                                      print(element.id);

                                      userId.add(element.id);
                                      // Get.toNamed(Routes.vendorList, arguments: element.id);
                                    })
                                  });

                          print(userId.length);
                          // print(abc);

                          // await FirebaseFirestore.instance
                          //     .collection("Services")
                          //     .get()
                          //     .then((value) => {
                          //           value.docs.forEach((element) {
                          //             // print(element.data());
                          //             // print(element.id);
                          //             if (element.id == categoryName) {
                          //               // print(element.id);
                          //               FirebaseFirestore.instance
                          //                   .collection("Services")
                          //                   .doc(element.id)
                          //                   .get()
                          //                   .then((value) =>
                          //                       {print(value.data())});
                          //             }
                          //           })
                          //         });
                        },
                        child: categories[index]);
                  },
                )),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Most Popular',
                    style: TextStyle(
                        fontFamily: 'Manrope-ExtraBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 22), //Theme.of(context).textTheme.headline4,
                  ),
                  GestureDetector(
                    onTap: () {/*see all logic goes here*/},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                          fontFamily: 'Manrope-Bold',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFCB585A),
                          fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.toNamed('vendor_page');
                // Get.toNamed(NamedRoutes.vendorScreen);
                },
              child: ListView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), //(singleChildScrollable is already being used so disallow listview builder to scroll)
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VendorDetailsScreen(restaurant: restaurants[index]),
                        ));
                      },
                      child: RestaurantCard(restaurant: restaurants[index]),
                    );
                    //return RestaurantCard(restaurant: restaurants[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
// <<<<<<< HEAD

class CustomBottomNabBar extends StatefulWidget {
  const CustomBottomNabBar({Key? key}) : super(key: key);
  @override
  State<CustomBottomNabBar> createState() => _CustomBottomNabBarState();
}

class _CustomBottomNabBarState extends State<CustomBottomNabBar> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Color(0xFFCB585A)),
          ),
        ),
        child: BottomNavigationBar(
          onTap: onTabTapped,
          showSelectedLabels: false, // Do not show labels for selected items
          showUnselectedLabels:
              false, // Do not show labels for unselected items
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              activeIcon: Stack(children: [
                Icon(Icons.home, color: Color(0xFFCB585A)),
                Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Icon(
                      Icons.brightness_1,
                      size: 8.0, /*color: Colors.red*/
                    ))
              ]),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_rounded),
              label: 'Messages',
              activeIcon: Stack(children: [
                Icon(Icons.message_rounded, color: Color(0xFFCB585A)),
                Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Icon(
                      Icons.brightness_1,
                      size: 8.0, /*color: Colors.red*/
                    ))
              ]),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              activeIcon: Stack(
                children: [
                  Icon(
                    Icons.settings,
                    color: Color(0xFFCB585A),
                  ),
                  Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: Icon(
                        Icons.brightness_1,
                        size: 8.0, /*color: Colors.red*/
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
