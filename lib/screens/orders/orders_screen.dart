import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/constants/font.dart';
import 'package:eventually_user/controllers/place_order_controller.dart';
import 'package:eventually_user/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../controllers/order_btn_controller.dart';
import '../../firebasemethods/userAuthentication.dart';
import '../../widget/text_appbar.dart';
import 'components/all_orders.dart';
import 'components/button.dart';
import 'components/order_card.dart';

// late Size Get;

class OrdersScreen extends StatefulWidget {
  OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final OrdersBtnController controller = Get.put(OrdersBtnController());

  final placeorderController = Get.put(placeOrderController());

  TimeOfDay parseTimeStringToTimeOfDay(String timeString) {
    // Extracting the time part from the string (e.g., "12:36")
    String timePart =
        timeString.replaceAll('TimeOfDay(', '').replaceAll(')', '');

    // Splitting the time part into hours and minutes
    List<String> parts = timePart.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    return TimeOfDay(hour: hour, minute: minute);
  }

  bool hasActiveOrder = false;
  @override
  Widget build(BuildContext context) {
    int count = 0;
    if (controller.isFirstButtonActive.value) {
      controller.setActiveButtonColor();
    } else {
      controller.setAllButtonColor();
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(NamedRoutes.drawer);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Your Orders',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: Get.width * 0.05,
              fontWeight: AppFonts.bold,
              fontFamily: AppFonts.manrope,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width * .06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => ListOrderButton(
                      title: 'Active Orders',
                      color: controller.activeButtonColor.value,
                      onpressed: () {
                        controller.setActiveButtonColor();
                        placeorderController.enableCancelOrderButton.value =
                            true;
                      },
                    ),
                  ),
                  SizedBox(width: Get.width * .05),
                  Obx(
                    () => ListOrderButton(
                      title: 'All Orders',
                      color: controller.allButtonColor.value,
                      onpressed: () {
                        controller.setAllButtonColor();
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * .01),
            Obx(
              () => controller.isFirstButtonActive.value
                  ? Expanded(
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('Orders')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.userIdToGetOrders.length,
                              itemBuilder: (context, currentIndex) {
                                placeorderController.disableToggle.value = true;

                                return StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('Orders')
                                        .doc(controller
                                            .userIdToGetOrders[currentIndex])
                                        .collection('bookings')
                                        .where('status', isEqualTo: 'active')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const ClampingScrollPhysics(),
                                            itemCount:
                                                snapshot.data!.docs.length,
                                            itemBuilder:
                                                (BuildContext context, index) {
                                              DocumentSnapshot doc =
                                                  snapshot.data!.docs[index];
                                              print(doc['Date of Delivery']
                                                  .toString());
                                              Timestamp firestoreTimestamp =
                                                  doc['Date of Delivery'];

                                              DateTime dateTime =
                                                  firestoreTimestamp.toDate();

                                              placeorderController.orderNumber
                                                  .value = doc['Order No'];

                                              print(doc['Start time']);

                                              return InkWell(
                                                onTap: () {
                                                  print(currentIndex);
                                                  print('sad');
                                                },
                                                child: OrderCard(
                                                    status: '',
                                                    userId: controller
                                                            .userIdToGetOrders[
                                                        currentIndex],
                                                    endTime: doc['End time'],
                                                    startTime:
                                                        doc['Start time'],
                                                    orderNo: doc['Order No'],
                                                    serviceDesc: doc[
                                                        'Service Description'],
                                                    date: dateTime,
                                                    index: currentIndex,
                                                    location: doc['location'],
                                                    noOfPerson:
                                                        doc['No of Person'],
                                                    price: doc['Service Price'],
                                                    vendorName:
                                                        doc['Vendor Name'],
                                                    vendorServiceName:
                                                        doc['Service Name'],
                                                    show: false),
                                              );
                                            });
                                      } else {
                                        return const Center(
                                          child: SpinKitFadingCircle(
                                            color: AppColors.pink,
                                          ),
                                        );
                                      }
                                    });
                              },
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    )
                  : Expanded(
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('Orders')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.userIdToGetOrders.length,
                                itemBuilder: (context, currentIndex) {
                                  placeorderController.disableToggle.value =
                                      true;
                                  placeorderController
                                      .enableCancelOrderButton.value = false;

                                  return StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('Orders')
                                          .doc(controller
                                              .userIdToGetOrders[currentIndex])
                                          .collection('bookings')
                                          // .where('status',
                                          //     isEqualTo: 'Completed')
                                          .snapshots(),
                                      builder: ((context, snapshot) {
                                        if (snapshot.hasData) {
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const ClampingScrollPhysics(),
                                              itemCount:
                                                  snapshot.data!.docs.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                DocumentSnapshot doc =
                                                    snapshot.data!.docs[index];
                                                print(doc['Date of Delivery']
                                                    .toString());
                                                Timestamp firestoreTimestamp =
                                                    doc['Date of Delivery'];

                                                DateTime dateTime =
                                                    firestoreTimestamp.toDate();

                                                placeorderController.orderNumber
                                                    .value = doc['Order No'];

                                                print(doc['Start time']);

                                                return InkWell(
                                                  onTap: () {
                                                    print(currentIndex);
                                                    print('sad');
                                                  },
                                                  child: OrderCard(
                                                      status: doc['status'] ==
                                                              'active'
                                                          ? "active"
                                                          : "Completed",
                                                      userId: controller
                                                              .userIdToGetOrders[
                                                          currentIndex],
                                                      endTime: doc['End time'],
                                                      startTime:
                                                          doc['Start time'],
                                                      orderNo: doc['Order No'],
                                                      serviceDesc: doc[
                                                          'Service Description'],
                                                      date: dateTime,
                                                      index: currentIndex,
                                                      location: doc['location'],
                                                      noOfPerson:
                                                          doc['No of Person'],
                                                      price:
                                                          doc['Service Price'],
                                                      vendorName:
                                                          doc['Vendor Name'],
                                                      vendorServiceName:
                                                          doc['Service Name'],
                                                      show: doc['status'] ==
                                                              'active'
                                                          ? false
                                                          : true),
                                                );
                                              });
                                        } else {
                                          return const Center(
                                            child: SpinKitFadingCircle(
                                              color: AppColors.pink,
                                            ),
                                          );
                                        }
                                      }));
                                },
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
              // : Container(),
            )
          ],
        ),
      ),
    );
  }
}
