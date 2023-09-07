import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/controllers/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<String> items = [
  "Photographer",
  "Caterers",
  "Venue",
  "Florist",
  "Decorators",
  "Card printers",
];
List<String> filteredItems = [];

class Searchbar extends StatefulWidget {
  const Searchbar({
    Key? key,
  }) : super(key: key);

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  void filterSearchResults(String query) {
    List<String> searchResults = [];
    if (query.isNotEmpty) {
      items.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(item);
        }
      });
    } else {
      searchResults.addAll(items);
    }
    setState(() {
      filteredItems.clear();
      filteredItems.addAll(searchResults);
    });
  }

  @override
  void initState() {
    super.initState();
    filteredItems.addAll(items);
  }

  @override
  Widget build(BuildContext context) {
    final homePageController = Get.put(homepage_controller());

    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Material(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Obx(
                () => TextField(
                    controller: homePageController.searchController,
                    decoration: InputDecoration(
                      //when outside searchbar
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors
                              .transparent, // Change the border color here
                          width: 1.0,
                        ),
                      ),
                      //when inside searchbar
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(15.0),
                          topRight: const Radius.circular(15.0),
                          bottomLeft:
                              homePageController.showSuggestion.value == true
                                  ? const Radius.circular(0.0)
                                  : const Radius.circular(15.0),
                          bottomRight:
                              homePageController.showSuggestion.value == true
                                  ? const Radius.circular(0.0)
                                  : const Radius.circular(15.0),
                        ),
                        borderSide: const BorderSide(
                          color: Color(0xFFCB585A),
                          width: 2.0,
                        ),
                      ),

                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search for vendors, services and planners',
                      suffixIcon: homePageController.showSuggestion.value ==
                              false
                          ? const Icon(
                              Icons.search,
                              color: Color(0xFF555555),
                            )
                          : IconButton(
                              onPressed: () {
                                homePageController.searchController.clear();
                                homePageController.showSuggestion.value = false;
                              },
                              icon: const Icon(Icons.cancel),
                              color: AppColors.pink,
                            ),
                    ),
                    onChanged: (value) {
                      filterSearchResults(value);
                      homePageController.showSuggestion.value = true;
                      if (homePageController.searchController.text.isEmpty) {
                        homePageController.showSuggestion.value = false;
                      }
                    }),
              ),
            ),
          ),
        ),
        Obx(
          () => homePageController.showSuggestion.value == true
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Expanded(
                    child: Center(
                      child: Container(
                        width: Get.width * 0.86,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                homePageController.showSuggestion.value = false;
                              },
                              child: Container(
                                width: Get.width * 0.1,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColors.grey.withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                child: ListTile(
                                  leading:
                                      const Icon(Icons.arrow_forward_outlined),
                                  title: Text(filteredItems[index]),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
