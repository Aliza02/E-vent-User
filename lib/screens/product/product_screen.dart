import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/controllers/homepage_controller.dart';
import 'package:eventually_user/controllers/message_controller.dart';
import 'package:eventually_user/controllers/offer_btn_controller.dart';
import 'package:eventually_user/controllers/place_order_controller.dart';
import 'package:eventually_user/controllers/product_controller.dart';
import 'package:eventually_user/controllers/vendor_detail_controller.dart';
import 'package:eventually_user/firebaseMethods/userAuthentication.dart';
import 'package:eventually_user/models/chat_user.dart';
import 'package:eventually_user/screens/chat/chat_screen.dart';
import 'package:eventually_user/screens/home_page/home_page.dart';
import 'package:eventually_user/widget/BottomNavBar/bottomNavBar.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/order_pic_controller.dart';
import '../../routes.dart';
import '../../widget/button.dart';
import '../../widget/price_people_text.dart';
import '../../widget/product_categories.dart';
import '../../widget/product_image_view.dart';
import '../../widget/product_title_text.dart';

import 'components/change_people_count_row.dart';
import 'components/duration_button.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  OrderPicController orderPicController = Get.put(OrderPicController());
  final msgController = Get.put(MessageController());
  final btnController = Get.put(ButtonController());
  DateTime selectedDate = DateTime.now();
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  final buttonStyle = ElevatedButton.styleFrom(
    primary: Colors.white,
    onPrimary: Color(constant.red),
    elevation: 8,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(constant.red),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    padding: EdgeInsets.zero,
  );
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    final serviceName = arguments[0];
    final serviceDesc = arguments[1];
    final servicePrice = arguments[2];
    final noOfPerson = arguments[3];
    final businessName = arguments[4];
    final vendorId = arguments[5];

    final OrderController controller = Get.put(OrderController());
    final homePageController = Get.put(homepage_controller());
    final placeorderController = Get.put(placeOrderController());
    final vendorController = Get.put(vendorDetailController());
    final orderController = Get.put(OrderController());

    String chatroomId(String vendor, String user) {
      if (vendor.hashCode <= user.hashCode) {
        return '$vendor$user';
      } else {
        return '$user$vendor';
      }
    }

    controller.priceRange.value = servicePrice;
    return SafeArea(
      // bottomNavigationBar: const CustomBottomNabBar(),

      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                msgController.servicePriceOnChatOffer.clear();
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.pink)),
        ),
        bottomNavigationBar: bottomNavBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .07),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProductImageView(orderPicController: orderPicController),
                SizedBox(height: Get.height * .02),
                ProductTitleText(title: serviceName),
                SizedBox(height: Get.height * .02),
                ProductDescription(
                  description: serviceDesc,
                ),
                SizedBox(height: Get.height * .01),
                const PriceAndPeopleText(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        "${controller.priceRange} Rs",
                        style: TextStyle(
                          color: Color(constant.lightGrey),
                          fontSize: Get.width * 0.06,
                          fontFamily: constant.font,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Obx(
                      () => homePageController.businessCategory.value ==
                              'Photographer'
                          ? const SizedBox()
                          : ChangePeopleCountRow(
                              people: noOfPerson,
                            ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * .01),
                Row(
                  children: [
                    Text(
                      'Select a date',
                      style: TextStyle(
                        color: Color(constant.lightGrey),
                        fontSize: 14,
                        fontFamily: constant.font,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: Get.width * .04),
                        child: ElevatedButton(
                          onPressed: () {
                            _showDatePicker(context, DatePickerMode.day);
                          },
                          style: buttonStyle,
                          child: Text(
                            selectedDate.day.toString(),
                            style: TextStyle(
                              color: const Color(0x7F555454),
                              fontSize: 16,
                              fontFamily: constant.font,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _showDatePicker(context, DatePickerMode.day);
                        },
                        style: buttonStyle,
                        child: Text(
                          selectedDate.month.toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: const Color(0x7F555454),
                            fontSize: 16,
                            fontFamily: constant.font,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: Get.width * .04),
                        child: ElevatedButton(
                          onPressed: () {
                            _showDatePicker(context, DatePickerMode.day);
                          },
                          style: buttonStyle,
                          child: Text(
                            selectedDate.year.toString(),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: const Color(0x7F555454),
                              fontSize: 16,
                              fontFamily: constant.font,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * .01),
                Row(
                  children: [
                    Text(
                      'Select a location',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(constant.lightGrey),
                        fontSize: 14,
                        fontFamily: constant.font,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer()
                  ],
                ),
                SizedBox(height: Get.height * .01),
                TextFormField(
                  controller: controller.location,
                  style: TextStyle(
                    color: const Color(0x7F555454),
                    fontSize: 16,
                    fontFamily: constant.font,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    hintText: 'Enter the address',
                    hintStyle: TextStyle(
                      color: const Color(0x7F555454),
                      fontSize: 16,
                      fontFamily: constant.font,
                      fontWeight: FontWeight.w700,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Color(0xFF4285F4),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Color(0xFF4285F4),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * .01),
                Row(
                  children: [
                    Text(
                      'Select a Duration',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(constant.lightGrey),
                        fontSize: 14,
                        fontFamily: constant.font,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer()
                  ],
                ),
                SizedBox(height: Get.height * .01),
                Row(
                  children: [
                    DurationButton(
                      imagePath: 'assets/images/flag.svg',
                      buttonText: 'Start Time',
                    ),
                    SizedBox(width: Get.width * .03),
                    DurationButton(
                      imagePath: 'assets/images/flag-alt.svg',
                      buttonText: 'End Time',
                    ),
                  ],
                ),
                SizedBox(height: Get.height * .009),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Button(
                        label: 'Add to Cart',
                        onPressed: () {
                          placeorderController.serviceName.add(serviceName);
                          placeorderController.servicePrice
                              .add(controller.priceRange.value);
                          placeorderController.vendorName.add(businessName);
                          placeorderController.location
                              .add(controller.location.text);
                          placeorderController.noOfPerson.add(noOfPerson);
                          placeorderController.date.add(selectedDate);
                          // placeorderController.enableCancelOrderButton.value =
                          //     false;
                          Get.toNamed(
                            NamedRoutes.myCart,
                          );
                        },
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * .02),
                      child: Text(
                        'Or',
                        style: TextStyle(
                          color: const Color(0x7F555454),
                          fontSize: 12,
                          fontFamily: constant.font,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 38,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF4285F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          shadows: shadowsBelow,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(18),
                          onTap: () {
                            msgController.servicePriceOnChatOffer.clear();
                            ChatUser user = ChatUser(
                              about: 'dsad',
                              email: 'dasd',
                              id: 'sad',
                              isOnline: false,
                              lastActive: 'dda',
                              name: businessName,
                              pushToken: 'dsad',
                            );
                            print('jkjl');
                            msgController.chatRoomId.value = chatroomId(
                                vendorController.userId.value,
                                auth.currentUser!.uid);

                            msgController.userName.value =
                                auth.currentUser!.displayName!;

                            msgController.serviceNameOnChatOffer.value =
                                serviceName;
                            btnController.fromProductScreen.value = true;
                            msgController.businessName.value = businessName;

                            if (controller.priceRange.value.contains('-')) {
                              print('split');
                              List<String> parts =
                                  controller.priceRange.value.split('-');
                              if (parts[0].length == 4) {
                                int price = int.parse(parts[0]);

                                msgController.servicePriceOnChatOffer
                                    .add(price - 100);
                                btnController
                                        .offerAmountEditingController.text =
                                    msgController.servicePriceOnChatOffer[0]
                                        .toString();

                                msgController.servicePriceOnChatOffer
                                    .add(price - 200);
                                msgController.servicePriceOnChatOffer
                                    .add(price - 300);
                              } else if (parts[0].length == 5) {
                                int price = int.parse(parts[0]);

                                msgController.servicePriceOnChatOffer
                                    .add(price - 1000);

                                msgController.servicePriceOnChatOffer
                                    .add(price - 2000);
                                msgController.servicePriceOnChatOffer
                                    .add(price - 3000);
                              } else if (parts[0].length == 6) {
                                int price = int.parse(parts[0]);

                                msgController.servicePriceOnChatOffer
                                    .add(price - 10000);

                                msgController.servicePriceOnChatOffer
                                    .add(price - 15000);
                                msgController.servicePriceOnChatOffer
                                    .add(price - 20000);
                              }
                              print(
                                  msgController.servicePriceOnChatOffer.length);
                            } else {
                              if (servicePrice.length == 4) {
                                int price = int.parse(servicePrice);

                                msgController.servicePriceOnChatOffer
                                    .add(price - 100);

                                msgController.servicePriceOnChatOffer
                                    .add(price - 200);
                                msgController.servicePriceOnChatOffer
                                    .add(price - 300);
                              } else if (servicePrice.length == 5) {
                                int price = int.parse(servicePrice);

                                msgController.servicePriceOnChatOffer
                                    .add(price - 1000);
                                msgController.servicePriceOnChatOffer
                                    .add(price - 2000);
                                msgController.servicePriceOnChatOffer
                                    .add(price - 3000);
                              } else if (servicePrice.length == 6) {
                                int price = int.parse(servicePrice);

                                msgController.servicePriceOnChatOffer
                                    .add(price - 10000);
                                msgController.servicePriceOnChatOffer
                                    .add(price - 15000);
                                msgController.servicePriceOnChatOffer
                                    .add(price - 20000);
                              }
                            }

                            print(msgController.servicePriceOnChatOffer.length);

                            Get.to(
                              () => ChatScreen(
                                user: user,
                              ),
                              arguments: serviceName,
                            );
                          },
                          child: Center(
                            child: Text(
                              'Chat With Vendor',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.18,
                                fontFamily: constant.font,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDatePicker(
      BuildContext context, DatePickerMode mode) async {
    DateTime initialDate;
    DateTime firstDate;
    DateTime lastDate;

    Function(DateTime) setSelectedValue;

    if (mode == DatePickerMode.day) {
      initialDate = selectedDate;
      firstDate = DateTime(1900);
      lastDate = DateTime(2100);
      setSelectedValue = (DateTime date) {
        setState(() {
          selectedDate = date;
        });
        print(selectedDate);
      };
    } else {
      initialDate = DateTime(selectedYear, selectedMonth);
      firstDate = DateTime(DateTime.now().year, 1);
      lastDate = DateTime(DateTime.now().year, 12);
      setSelectedValue = (DateTime date) {
        setState(() {
          selectedMonth = date.month;
        });
      };
    }

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDatePickerMode: mode,
    );

    if (pickedDate != null) {
      setSelectedValue(pickedDate);
    }
  }

  Future<void> _showMonthPicker(BuildContext context) async {
    final List<String> months =
        DateFormat.MMMM().format(DateTime.now()).split(' ');

    final pickedMonth = await showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoPicker(
            itemExtent: 50,
            onSelectedItemChanged: (int index) {},
            children: months.map((String month) {
              return Center(
                child: Text(
                  month,
                  style: const TextStyle(fontSize: 20),
                ),
              );
            }).toList(),
          ),
        );
      },
    );

    if (pickedMonth != null) {
      setState(() {
        selectedMonth =
            pickedMonth + 1; // Add 1 to match DateTime month range (1-12)
      });
    }
  }
}
