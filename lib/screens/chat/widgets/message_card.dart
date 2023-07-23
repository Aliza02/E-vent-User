import 'dart:developer';

import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';
import '../../../controllers/offer_btn_controller.dart';
import '../../../helper/my_date_util.dart';
import '../../../models/message_model.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({super.key, required this.message, required this.index});
  final MessageModel message;
  final int index;
  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  final ButtonController _btnController = Get.find<ButtonController>();
  @override
  Widget build(BuildContext context) {
    log(widget.index.toString());
    return widget.index.isEven ? _userMessage() : _othersMessage();
  }

  //!Sender or Another user message
  Widget _othersMessage() {
    return widget.message.type == MsgType.offer
        ? const SizedBox() //Offer Container
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
                                          fontSize: 15, color: Colors.black87),
                                    ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 20,
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
                                            'You Offered Rs ${_btnController.offerAmountEditingController.text}',
                                            style: TextStyle(
                                                // overflow: TextOverflow.fade,
                                                fontSize: 18,
                                                color: Color(constant.blue),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Obx(
                                            () => _btnController
                                                    .isViewMoreToggled.value
                                                ? Padding(
                                                    padding: EdgeInsets.only(
                                                        top: Get.height * .03),
                                                    child: Text(
                                                      _btnController
                                                          .offerDetailsEditingController
                                                          .text
                                                          .toString(),
                                                    ),
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
                                          vertical: Get.height * .01,
                                          horizontal: Get.width * .04),
                                      height: Get.height * .055,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Shadi Package',
                                            style: TextStyle(
                                                color: Color(constant.grey)),
                                          ),
                                          Obx(
                                            () => TextButton(
                                              child: Text(
                                                _btnController
                                                    .viewMoreLessText(),
                                                style: TextStyle(
                                                    color: Color(constant.red)),
                                              ),
                                              onPressed: () {
                                                _btnController.toggleViewMore();
                                              },
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
                          bottom: 0,
                          right: 20,
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
                            border: Border.all(
                                color: Color(constant.white), width: 2),
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
                        Positioned(
                          right: 20,
                          bottom: 12,
                          child: Icon(Icons.done_rounded,
                              color: Color(constant.red), size: 20),
                        ),
                        Positioned(
                          bottom: 0,
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
