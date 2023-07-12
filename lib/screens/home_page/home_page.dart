import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/all_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CategoryBox> categories = [
    const CategoryBox(
        image: 'assets/images/photographer.jpg', name: 'Photographers'),
    const CategoryBox(image: 'assets/images/venues.jpg', name: 'Venues'),
    const CategoryBox(image: 'assets/images/caterers.jpg', name: 'Caterers'),
    // Add more categories here...
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNabBar(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color(0xFFCB585A),
              ),
              onPressed: () {
                Get.toNamed('/product');
              },
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/order');
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
          //row containing Categories heading and see all button

          Padding(
            padding: const EdgeInsets.all(20.0),
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
          //categories shown below:
          SizedBox(
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return categories[index];
                },
              )),
          //),
        ],
      ),
    );
  }
}

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
          items: const [
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
              activeIcon: Stack(children: [
                Icon(Icons.settings, color: Color(0xFFCB585A)),
                Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Icon(
                      Icons.brightness_1,
                      size: 8.0, /*color: Colors.red*/
                    ))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
