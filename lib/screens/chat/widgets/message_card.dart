import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/constants/font.dart';
import 'package:eventually_user/controllers/message_controller.dart';
import 'package:eventually_user/controllers/offer_btn_controller.dart';
import 'package:eventually_user/controllers/place_order_controller.dart';
import 'package:eventually_user/routes.dart';
import 'package:eventually_user/screens/product/components/duration_button.dart';
import 'package:eventually_user/widget/button.dart';
import 'package:eventually_user/widget/vendorDetailScreen/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';

import '../../../firebasemethods/userAuthentication.dart';
import '../../../helper/my_date_util.dart';
import '../../../models/message_model.dart';

class MessageCard extends StatefulWidget {
  const MessageCard(
      {super.key,
      required this.message,
      required this.sendby,
      required this.serviceName,
      required this.index});
  final MessageModel message;
  final String sendby;
  final int index;
  final String serviceName;
  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  final ButtonController _btnController = Get.put(ButtonController());
  final msgcontroller = Get.put(MessageController());
  final placeorderController = Get.put(placeOrderController());

  String servicePrice = '';
  String serviceDesc = '';
  String sendby = '';
  int sent = 0;

  final TextEditingController locationController = TextEditingController();
  final TextEditingController noOfPerson = TextEditingController();
  DateTime selectedDate = DateTime.now();
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    log(widget.sendby.toString());
    return widget.sendby == auth.currentUser!.displayName
        ? _userMessage()
        : _othersMessage();
  }

  Future<void> _showDatePicker(
      BuildContext context, DatePickerMode mode) async {
    DateTime initialDate;
    DateTime firstDate;
    DateTime lastDate;

    Function(DateTime) setSelectedValue;

    if (mode == DatePickerMode.day) {
      initialDate = placeorderController.selecteddate.value;
      firstDate = DateTime(1900);
      lastDate = DateTime(2100);
      setSelectedValue = (DateTime date) {
        setState(() {
          placeorderController.selecteddate.value = date;
          print(placeorderController.selecteddate.value);
        });
      };
    } else {
      initialDate = DateTime(
          placeorderController.year.value, placeorderController.month.value);
      firstDate = DateTime(DateTime.now().year, 1);
      lastDate = DateTime(DateTime.now().year, 12);
      setSelectedValue = (DateTime date) {
        setState(() {
          placeorderController.month.value = date.month;
          // print(selectedDate);
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
      print('date picked');
    }
  }

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

  bool cartLoading = false;

// widget to get information from user to place an order
  Widget bottomSheetForOrderDetails(BuildContext context) {
    return InkWell(
      onTap: () async {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              // height: Get.height * 0.5,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Text(
                      'Order Details',
                      style: TextStyle(
                        color: AppColors.pink,
                        fontSize: Get.width * 0.06,
                        fontFamily: AppFonts.manrope,
                        fontWeight: AppFonts.extraBold,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    SizedBox(
                        width: Get.width * 0.8,
                        child: orderDetailsTextFormField(
                          controller: locationController,
                          title: 'Enter Location',
                          inputType: TextInputType.text,
                        )),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    SizedBox(
                      width: Get.width * 0.8,
                      child: orderDetailsTextFormField(
                        controller: noOfPerson,
                        title: 'Enter No of People',
                        inputType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    SizedBox(
                      width: Get.width * 0.8,
                      child: Row(
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
                    ),
                    SizedBox(
                      width: Get.width * 0.8,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: Get.width * .04),
                              child: ElevatedButton(
                                onPressed: () {
                                  _showDatePicker(context, DatePickerMode.day);
                                },
                                style: buttonStyle,
                                child: Obx(
                                  () => Text(
                                    placeorderController.selecteddate.value.day
                                        .toString(),
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
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                _showDatePicker(context, DatePickerMode.day);
                              },
                              style: buttonStyle,
                              child: Obx(
                                () => Text(
                                  placeorderController.selecteddate.value.month
                                      .toString(),
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
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: Get.width * .04),
                              child: ElevatedButton(
                                onPressed: () {
                                  _showDatePicker(context, DatePickerMode.day);
                                },
                                style: buttonStyle,
                                child: Obx(
                                  () => Text(
                                    placeorderController.selecteddate.value.year
                                        .toString(),
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    SizedBox(
                      width: Get.width * 0.8,
                      child: Row(
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
                    ),
                    SizedBox(
                      width: Get.width * 0.8,
                      child: Row(
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
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Obx(
                      () => Container(
                        height: Get.height * 0.06,
                        margin: EdgeInsets.only(
                          bottom: Get.height * 0.04,
                        ),
                        child: _btnController.cartLoading.value == false
                            ? Button(
                                label: 'Add to Cart',
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('messages')
                                      .doc(msgcontroller.chatRoomId.value)
                                      .collection('chat')
                                      .orderBy('sent')
                                      .get()
                                      .then((value) {
                                    value.docs.forEach((element) async {
                                      if (element.data()['amount'] ==
                                              widget.message.msg &&
                                          element.data()['package'] ==
                                              widget.serviceName) {
                                        print(element.data()['amount']);

                                        print(element.data());

                                        servicePrice = element.data()['amount'];

                                        sendby = element.data()['sendby'];
                                        serviceDesc = element
                                            .data()['service description'];

                                        sent =
                                            int.parse(element.data()['sent']);

                                        print(servicePrice);
                                      }
                                    });
                                  });

                                  if (locationController.text.isNotEmpty &&
                                      noOfPerson.text.isNotEmpty) {
                                    _btnController.cartLoading.value = true;
                                    placeorderController.serviceName
                                        .add(widget.serviceName);
                                    placeorderController.servicePrice
                                        .add(servicePrice);
                                    placeorderController.vendorName
                                        .add(msgcontroller.businessName.value);
                                    placeorderController.location
                                        .add(locationController.text);
                                    placeorderController.serviceDesc
                                        .add(serviceDesc);
                                    placeorderController.noOfPerson
                                        .add(noOfPerson.text);
                                    placeorderController.date.add(selectedDate);

                                    // placeorderController
                                    //     .enableCancelOrderButton.value = true;
                                    _btnController.cartLoading.value = false;
                                    Get.toNamed(
                                      NamedRoutes.myCart,
                                    );
                                  } else {
                                    Get.showSnackbar(
                                      const GetSnackBar(
                                        title: 'Incomplete Fields',
                                        message: 'Enter complete details ',
                                        backgroundColor: AppColors.pink,
                                        duration: Duration(seconds: 2),
                                        icon: Icon(
                                            Icons.incomplete_circle_rounded),
                                      ),
                                    );
                                  }
                                },
                              )
                            : const SpinKitFadingCircle(
                                color: AppColors.pink,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: const Row(
        children: [
          Text(
            'Checkout',
            style: TextStyle(
              color: Colors.white,
              fontWeight: AppFonts.bold,
              fontFamily: AppFonts.manrope,
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 16.0,
          ),
        ],
      ),
    );
  }

  //!Sender or Another user message
  Widget _othersMessage() {
    print(widget.message.msg);
    // int currentIndex = _btnController.selectedCardIndex.value;
    return widget.message.type == MsgType.offer
        ? Column(
            //Offer Container
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Stack(
                      children: [
                        Container(
                          width: Get.width * .7,
                          margin: EdgeInsets.symmetric(
                              vertical: Get.height * .02,
                              horizontal: Get.width * .04),
                          child: widget.message.type == MsgType.offer
                              ? Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                          widget.message.type == MsgType.file
                                              ? Get.width * .03
                                              : Get.width * 0.04),
                                      decoration: BoxDecoration(
                                        // border: Border.all(
                                        //     // color: Color(constant.),
                                        //     width: 2),
                                        color: Color(constant.lightPink),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(15),
                                        ),
                                      ),
                                      // height: Get.height * .1,
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${msgcontroller.businessName.value} Offered Rs ${widget.message.msg}',
                                            style: TextStyle(
                                                // overflow: TextOverflow.fade,
                                                fontSize: 18,
                                                color: Color(constant.red),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Obx(
                                            () => _btnController
                                                    .expansion[widget.index]
                                                ? Padding(
                                                    padding: EdgeInsets.only(
                                                        top: Get.height * .03),
                                                    child: Text(
                                                      widget.message.read,
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                widget.serviceName,
                                                style: TextStyle(
                                                    color:
                                                        Color(constant.grey)),
                                              ),
                                              Obx(
                                                () => TextButton(
                                                  child: Text(
                                                    _btnController
                                                        .viewMoreLessText(
                                                            widget.index),
                                                    style: TextStyle(
                                                        color: Color(
                                                            constant.red)),
                                                  ),
                                                  onPressed: () {
                                                    print('s');
                                                    _btnController
                                                        .toggleCardExpansion(
                                                            widget.index);
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Obx(
                                      () => Container(
                                        decoration: BoxDecoration(
                                          color: _btnController.acceptOfferList[
                                                      widget.index] ==
                                                  false
                                              ? Color(constant.blue)
                                              : Color(constant.red),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: Get.height * .01,
                                            horizontal: Get.width * .04),
                                        // height: Get.height * .055,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Obx(
                                              () => _btnController
                                                              .acceptOfferList[
                                                          widget.index] ==
                                                      false
                                                  ? TextButton(
                                                      child: Text(
                                                        'Accept Offer',
                                                        style: TextStyle(
                                                            fontSize:
                                                                Get.width *
                                                                    0.04,
                                                            fontFamily: AppFonts
                                                                .manrope,
                                                            fontWeight:
                                                                AppFonts.bold,
                                                            color: Color(
                                                                constant
                                                                    .white)),
                                                      ),
                                                      onPressed: () async {
                                                        _btnController
                                                            .toggleViewMore();

                                                        _btnController
                                                                .acceptOfferList[
                                                            widget
                                                                .index] = true;

                                                        print(widget.index);

                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'messages')
                                                            .doc(msgcontroller
                                                                .chatRoomId
                                                                .value)
                                                            .collection('chat')
                                                            .orderBy('sent')
                                                            .get()
                                                            .then((value) {
                                                          value.docs.forEach(
                                                              (element) async {
                                                            if (element.data()[
                                                                        'amount'] ==
                                                                    widget
                                                                        .message
                                                                        .msg &&
                                                                element.data()[
                                                                        'package'] ==
                                                                    widget
                                                                        .serviceName) {
                                                              print(element
                                                                      .data()[
                                                                  'amount']);
                                                              await FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'messages')
                                                                  .doc(msgcontroller
                                                                      .chatRoomId
                                                                      .value)
                                                                  .collection(
                                                                      'chat')
                                                                  .doc(element
                                                                      .id)
                                                                  .update({
                                                                'accept':
                                                                    'true',
                                                              });
                                                              print(element
                                                                  .data());

                                                              servicePrice =
                                                                  element.data()[
                                                                      'amount'];

                                                              sendby = element
                                                                      .data()[
                                                                  'sendby'];

                                                              sent = int.parse(
                                                                  element.data()[
                                                                      'sent']);
                                                            }
                                                          });
                                                        });
                                                      },
                                                    )
                                                  : Row(
                                                      children: [
                                                        Text(
                                                          'Offer accepted',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  Get.width *
                                                                      0.04,
                                                              fontFamily:
                                                                  AppFonts
                                                                      .manrope,
                                                              fontWeight:
                                                                  AppFonts.bold,
                                                              color: Color(
                                                                  constant
                                                                      .white)),
                                                        ),
                                                        SizedBox(
                                                            width: Get.width *
                                                                0.04),
                                                        bottomSheetForOrderDetails(
                                                            context),
                                                      ],
                                                    ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ) //still needs to implement for files
                              : Text(
                                  widget.message.msg,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black87),
                                ),
                        ),
                        Positioned(
                          bottom: Get.height * 0.01,
                          right: Get.width * 0.05,
                          child: Transform.translate(
                            offset: const Offset(0, 8),
                            child: Text(
                              MyDateUtil.getFormattedTime(
                                  context: context, time: widget.message.sent),
                              style: TextStyle(
                                  fontSize: 13, color: Color(constant.grey)),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.more_horiz_rounded),
                ],
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: Get.height * .02,
                              horizontal: Get.width * .01),
                          child: ClipPath(
                            clipper: UpperNipMessageClipperTwo(
                              MessageType.receive,
                              nipWidth: 8,
                              nipHeight: 5,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(
                                  widget.message.type == MsgType.file
                                      ? Get.width * .03
                                      : Get.width * 0.04),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(constant.red), width: 2),
                                color: Color(constant.red),
                                // borderRadius: const BorderRadius.only(
                                //   topLeft: Radius.circular(15),
                                //   topRight: Radius.circular(15),
                                //   bottomRight: Radius.circular(15),
                                // ),
                              ),
                              child: widget.message.type == MsgType.file
                                  ? Container(
                                      color: Colors.red,
                                      width: 10,
                                    ) //still needs to implement for files
                                  : Text(
                                      widget.message.msg,
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: Get.height * 0.01,
                          right: Get.width * 0.04,
                          child: Transform.translate(
                            offset: const Offset(0, 8),
                            child: Text(
                              MyDateUtil.getFormattedTime(
                                  context: context, time: widget.message.sent),
                              style: TextStyle(
                                  fontSize: 10, color: Color(constant.grey)),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.more_horiz_rounded),
                ],
              ),
            ],
          );
    //  Row(
    //   crossAxisAlignment: CrossAxisAlignment.end,
    //   children: [
    //     Flexible(
    //       child: Container(
    //         margin: EdgeInsets.symmetric(
    //             vertical: Get.height * .01, horizontal: Get.width * .04),
    //         padding: EdgeInsets.all(widget.message.type == MessageType.file
    //             ? Get.width * .03
    //             : Get.width * 0.04),
    //         decoration: BoxDecoration(
    //             border: Border.all(color: Color(constant.red), width: 2),
    //             color: Color(constant.red),
    //             borderRadius: const BorderRadius.only(
    //               topLeft: Radius.circular(30),
    //               topRight: Radius.circular(30),
    //               bottomRight: Radius.circular(30),
    //             )),
    //         child: widget.message.type == MessageType.text
    //             ? Text(
    //                 widget.message.msg,
    //                 style: const TextStyle(fontSize: 15, color: Colors.black87),
    //               )
    //             : ClipRRect(
    //                 //!for removing unnecessary corners in images
    //                 borderRadius: BorderRadius.circular(15),
    //                 child: CachedNetworkImage(
    //                   // height: Get.height * .05,
    //                   imageUrl: widget.message.msg,
    //                   placeholder: (context, url) => const Padding(
    //                     padding: EdgeInsets.all(8.0),
    //                     child: CircularProgressIndicator(strokeWidth: 2),
    //                   ),
    //                   errorWidget: (context, url, error) => const CircleAvatar(
    //                       child: Icon(CupertinoIcons.person)),
    //                 ),
    //               ),
    //       ),
    //     ),
    //     Padding(
    //       padding:
    //           EdgeInsets.only(bottom: Get.height * .01, right: Get.width * 0.03),
    //       child: Text(
    //         MyDateUtil.getFormattedTime(
    //             context: context, time: widget.message.sent),
    //         style: TextStyle(fontSize: 13, color: Color(constant.red)),
    //       ),
    //     )
    //   ],
    // );
  }

  //!Our or user message
  Widget _userMessage() {
    // DateTime test = DateTime.fromMillisecondsSinceEpoch(int.parse(widget.message.sent));
    return widget.message.type == MsgType.offer
        ? Column(
            //Offer Container
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.more_horiz_rounded),
                  Flexible(
                    child: Stack(
                      children: [
                        Container(
                          width: Get.width * .7,
                          margin: EdgeInsets.symmetric(
                              vertical: Get.height * .02,
                              horizontal: Get.width * .04),
                          child: widget.message.type == MsgType.offer
                              ? Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                          widget.message.type == MsgType.file
                                              ? Get.width * .03
                                              : Get.width * 0.04),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(constant.white),
                                            width: 2),
                                        color: Colors.transparent,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                      ),
                                      // height: Get.height * .1,
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'You Offered Rs ${widget.message.msg}',
                                            style: TextStyle(
                                                // overflow: TextOverflow.fade,
                                                fontSize: 18,
                                                color: Color(constant.blue),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Obx(
                                            () => _btnController
                                                    .expansion[widget.index]
                                                ? Padding(
                                                    padding: EdgeInsets.only(
                                                        top: Get.height * .03),
                                                    child: Text(
                                                        widget.message.read),
                                                  )
                                                : const SizedBox(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(constant.lightPink),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: Get.height * .005,
                                          horizontal: Get.width * .04),
                                      height: Get.height * .06,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Obx(
                                            () => _btnController
                                                            .acceptOfferList[
                                                        widget.index] ==
                                                    false
                                                ? Text(
                                                    widget.serviceName,
                                                    style: TextStyle(
                                                        color: Color(
                                                            constant.grey)),
                                                  )
                                                : Row(
                                                    children: [
                                                      // Text(
                                                      //   'Offer accepted',
                                                      //   style: TextStyle(
                                                      //       fontSize:
                                                      //           Get.width *
                                                      //               0.04,
                                                      //       fontFamily: AppFonts
                                                      //           .manrope,
                                                      //       fontWeight:
                                                      //           AppFonts.bold,
                                                      //       color: Color(
                                                      //           constant
                                                      //               .white)),
                                                      // ),
                                                      SizedBox(
                                                          width:
                                                              Get.width * 0.04),
                                                      bottomSheetForOrderDetails(
                                                          context),
                                                    ],
                                                  ),
                                          ),
                                          Obx(
                                            () => SizedBox(
                                              // height: Get.height * 0.03,
                                              child: TextButton(
                                                child: Text(
                                                  _btnController
                                                      .viewMoreLessText(
                                                          widget.index),
                                                  style: TextStyle(
                                                      color:
                                                          Color(constant.red)),
                                                ),
                                                onPressed: () {
                                                  _btnController
                                                      .toggleCardExpansion(
                                                          widget.index);
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ) //still needs to implement for files
                              : Text(
                                  widget.message.msg,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black87),
                                ),
                        ),
                        Positioned(
                          bottom: 6.0,
                          right: Get.width * 0.1,
                          child: Transform.translate(
                            offset: const Offset(0, 8),
                            child: Text(
                              MyDateUtil.getFormattedTime(
                                  context: context, time: widget.message.sent),
                              style: TextStyle(
                                  fontSize: 13, color: Color(constant.grey)),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.more_horiz_rounded),
                  Flexible(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: Get.height * .02,
                              horizontal: Get.width * .04),
                          padding: EdgeInsets.all(
                              widget.message.type == MsgType.file
                                  ? Get.width * .03
                                  : Get.width * 0.04),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey, width: 2),
                            color: Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          child: widget.message.type == MsgType.file
                              ? Container(
                                  color: Colors.red,
                                  width: 10,
                                ) //still needs to implement for files
                              : Text(
                                  widget.message.msg,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black87),
                                ),
                        ),
                        // Positioned(
                        //   right: 20,
                        //   bottom: 12,
                        //   child: Icon(Icons.done_rounded,
                        //       color: Color(constant.red), size: 20),
                        // ),
                        Positioned(
                          bottom: Get.height * 0.01,
                          left: 20,
                          child: Transform.translate(
                            offset: const Offset(0, 8),
                            child: Text(
                              MyDateUtil.getFormattedTime(
                                  context: context, time: widget.message.sent),
                              style: TextStyle(
                                  fontSize: 13, color: Color(constant.grey)),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}

class orderDetailsTextFormField extends StatelessWidget {
  final String title;
  final TextInputType inputType;
  final TextEditingController controller;
  const orderDetailsTextFormField({
    super.key,
    required this.title,
    required this.inputType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        fillColor: const Color(0xFFEFEFEF).withOpacity(0.5),
        filled: true,
        hintText: title,
        hintStyle: TextStyle(
          fontSize: Get.width * 0.04,
          color: Colors.grey,
          fontFamily: constant.font,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Get.width * 0.02),
          borderSide: const BorderSide(
            color: Color(0xFFCB585A),
            width: 1.3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Get.width * 0.02),
          borderSide: const BorderSide(
            color: Color(0xFFCB585A),
            width: 1.3,
          ),
        ),
      ),
    );
  }
}
