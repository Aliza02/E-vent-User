import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/constants/font.dart';
import 'package:eventually_user/controllers/homepage_controller.dart';
import 'package:eventually_user/controllers/vendor_detail_controller.dart';
import 'package:eventually_user/screens/product/product_screen.dart';
import 'package:eventually_user/widget/BottomNavBar/bottomNavBar.dart';
import 'package:eventually_user/widget/all_widgets.dart';
import 'package:eventually_user/widget/vendorDetailScreen/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class VendorDetailsScreen extends StatefulWidget {
  VendorDetailsScreen({
    super.key,
  });

  @override
  State<VendorDetailsScreen> createState() => _VendorDetailsScreenState();
}

class _VendorDetailsScreenState extends State<VendorDetailsScreen> {
  var arguments = Get.arguments;

  final vendorController = Get.put(vendorDetailController());
  final homePageController = Get.put(homepage_controller());

  List reviews = [
    'very nice services',
    'No doubt, incredible services by them. I am very happy with their services. I will recommend to everyone.',
    'I am very happy with their services. I will recommend to everyone.',
    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et',
  ];

  List rating = [
    4.8,
    5,
    2,
    2.5,
  ];
  List userName = [
    'Aliza Ansari',
    'Kulsoom Ali',
    'Aliza Ansari',
    'Kulsoom Ali',
  ];

  Widget aboutSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.022),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const text(label: "Category"),
          const SizedBox(height: 8),
          Text(arguments[1]),
          const SizedBox(height: 20),
          const text(label: 'Location'),
          const SizedBox(height: 8),
          Text(arguments[3]),
          const SizedBox(height: 20),
          const text(label: 'Description'),
          const SizedBox(height: 8),
          const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation"),
        ],
      ),
    );
  }

  Widget serviceSection(BuildContext context) {
    final VendorId = arguments[2];
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: Get.width * 0.01,
          mainAxisSpacing: Get.height * 0.01,
        ),
        itemCount: vendorController.serviceName.length,
        itemBuilder: (context, index) {
          print('builder');
          print(vendorController.serviceName.length);
          return GestureDetector(
            onTap: () {
              print(index);
              Get.to(() => ProductScreen(), arguments: [
                vendorController.serviceName[index],
                vendorController.serviceDescription[index],
                vendorController.servicePrice[index],
                vendorController.noOfPerson[index],
                homePageController.businessName.value,
                VendorId,
              ]);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Image.network(
                      height: Get.height * 0.14,
                      'https://images.unsplash.com/photo-1511018556340-d16986a1c194?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGJha2VyeXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60',
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        return Container(
                          child: child,
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        return loadingProgress == null
                            ? child
                            : SizedBox(
                                height: Get.height * 0.14,
                                child: const SpinKitFadingCircle(
                                  color: AppColors.pink,
                                ),
                              );
                      },
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vendorController.serviceName[index],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: Get.width * 0.04,
                            fontFamily: AppFonts.manrope,
                            fontWeight: AppFonts.bold,
                            color: AppColors.grey,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.004),
                        Text(
                          "${vendorController.servicePrice[index]}/${vendorController.noOfPerson[index]} person",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: Get.width * 0.03,
                            fontFamily: AppFonts.manrope,
                            fontWeight: AppFonts.bold,
                            color: AppColors.pink,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.004),
                        Text(
                          vendorController.serviceDescription[index],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: Get.width * 0.03,
                            fontFamily: AppFonts.manrope,
                            fontWeight: AppFonts.bold,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget reviewSection(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
          padding: EdgeInsets.all(Get.width * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.3),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ],
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    userName[index],
                    style: TextStyle(
                      color: AppColors.grey,
                      fontFamily: AppFonts.manrope,
                      fontWeight: AppFonts.extraBold,
                      fontSize: Get.width * 0.04,
                    ),
                  ),
                  SizedBox(width: Get.width * 0.4),
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 18,
                  ),
                  Text(
                    rating[index].toString(),
                    style: TextStyle(
                      color: AppColors.grey,
                      fontFamily: AppFonts.manrope,
                      fontWeight: AppFonts.extraBold,
                      fontSize: Get.width * 0.04,
                    ),
                  ),
                ],
              ),
              Text(
                reviews[index],
                style: TextStyle(
                  color: AppColors.grey.withOpacity(0.5),
                  fontFamily: AppFonts.manrope,
                  fontWeight: AppFonts.medium,
                  fontSize: Get.width * 0.028,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final vendorController = Get.put(vendorDetailController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                vendorController.noOfPerson.clear();
                vendorController.serviceDescription.clear();
                vendorController.serviceName.clear();
                vendorController.serviceImages.clear();
                vendorController.servicePrice.clear();
                vendorController.showAbout.value = true;
                vendorController.showReview.value = false;
                vendorController.showServices.value = false;
                print('all list clear');
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.pink)),
        ),
        bottomNavigationBar: bottomNavBar(),
        body: /*Enter body content here...Text("hi")*/
            SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                        "https://images.unsplash.com/photo-1511018556340-d16986a1c194?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGJha2VyeXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
                        height: Get.height * 0.27,
                        width: Get.width * 0.9,
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    arguments[0],
                    style: TextStyle(
                      fontSize: Get.width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(
                      () => vendorController.showAbout.value == true
                          ? SizedBox(
                              width: Get.width * 0.27,
                              height: Get.height * 0.07,
                              child: Button(
                                label: 'About',
                                onPressed: () {},
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                vendorController.showAbout.value = true;
                                vendorController.showReview.value = false;
                                vendorController.showServices.value = false;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: Get.width * 0.27,
                                height: Get.height * 0.07,
                                decoration: BoxDecoration(
                                  color: AppColors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  'About',
                                  style: TextStyle(
                                    fontFamily: AppFonts.manrope,
                                    fontWeight: AppFonts.bold,
                                    fontSize: Get.width * 0.04,
                                    color: AppColors.grey,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Obx(
                      () => vendorController.showServices.value == true
                          ? SizedBox(
                              width: Get.width * 0.27,
                              height: Get.height * 0.07,
                              child: Button(
                                label: 'Services',
                                onPressed: () {},
                              ),
                            )
                          : GestureDetector(
                              onTap: () async {
                                vendorController.showAbout.value = false;
                                vendorController.showReview.value = false;
                                vendorController.showServices.value = true;
                                print('ser');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: Get.width * 0.27,
                                height: Get.height * 0.07,
                                decoration: BoxDecoration(
                                  color: AppColors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  'Services',
                                  style: TextStyle(
                                    fontFamily: AppFonts.manrope,
                                    fontWeight: AppFonts.bold,
                                    fontSize: Get.width * 0.04,
                                    color: AppColors.grey,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Obx(
                      () => vendorController.showReview.value == true
                          ? SizedBox(
                              width: Get.width * 0.27,
                              height: Get.height * 0.07,
                              child: Button(
                                label: 'Review',
                                onPressed: () {},
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                vendorController.showReview.value = true;
                                vendorController.showServices.value = false;
                                vendorController.showAbout.value = false;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: Get.width * 0.27,
                                height: Get.height * 0.07,
                                decoration: BoxDecoration(
                                  color: AppColors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  'Review',
                                  style: TextStyle(
                                    fontFamily: AppFonts.manrope,
                                    fontWeight: AppFonts.bold,
                                    fontSize: Get.width * 0.04,
                                    color: AppColors.grey,
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Obx(
                  () => vendorController.showAbout.value == true
                      ? aboutSection(context)
                      : SizedBox(),
                ),
                Obx(
                  () => vendorController.showServices.value == true
                      ? serviceSection(context)
                      : SizedBox(),
                ),
                Obx(
                  () => vendorController.showReview.value == true
                      ? reviewSection(context)
                      : SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
