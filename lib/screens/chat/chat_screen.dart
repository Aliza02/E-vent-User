import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/controllers/message_controller.dart';
import 'package:eventually_user/controllers/offer_btn_controller.dart';
import 'package:eventually_user/controllers/place_order_controller.dart';
import 'package:eventually_user/models/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/colors.dart';
import '../../firebasemethods/userAuthentication.dart';
import '../../models/chat_user.dart';
import 'widgets/chat_offer_toggler.dart';
import 'widgets/message_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.user});
  final ChatUser user;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ButtonController _buttonController = Get.put(ButtonController());
  late MessageModel message;
  final _msgController = Get.put(MessageController());
  final placeorderController = Get.put(placeOrderController());

  // final firebasecontroller = Get.put(firebaseController());
  var arg = Get.arguments;
  // late MessageModel message;
  // final ButtonController _buttonController = Get.find<ButtonController>();
  // final MessageController _msgController = Get.find<MessageController>();
  // _showEmoji for showing the value of showing or hiding emoji
  //_isUploading for checking if image is uploading or not
  bool _sendFile = false;
  bool isUploading = false;

  //for handling text message changes
  final _textController = TextEditingController();
  final controller = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    // String msgSendBy = firebasecontroller.businessName.value;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          // if (_showEmoji) {
          //   setState(() {
          //     _showEmoji = !_showEmoji;
          //   });
          //   return Future.value(false);
          // } else {
          // }
          return Future.value(true);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              backgroundColor: AppColors.appBar,
              elevation: 0,
              shape: const Border(
                bottom: BorderSide(
                  color:
                      AppColors.pink, // Change the color to your desired color
                  width: 2.0,
                ),
              ),
              automaticallyImplyLeading: false,
              flexibleSpace: _appBar()),
          // backgroundColor: Color.fromARGB(255, 255, 255, 255),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              children: [
                // Expanded(
                //   child: StreamBuilder(
                //     // stream: APIs.getAllMessages(widget.user),
                //     builder: (context, snapshot) {
                //       switch (snapshot.connectionState) {
                //         //!if data is loading
                //         // // if data is small then it will be loaded immediately
                //         case ConnectionState.none:
                //         case ConnectionState.waiting:
                //           return const SizedBox();
                //         //!if data is loaded
                //         case ConnectionState.active:
                //         case ConnectionState.done:
                //           final data = snapshot.data?.docs;
                //           _msgController.list = data
                //                   ?.map((e) => MessageModel.fromJson(e.data()))
                //                   .toList() ??
                //               [];
                //           if (_msgController.list.isNotEmpty) {
                //             return ListView.builder(
                //               reverse: true,
                //               itemCount: _msgController.list.length,
                //               padding: EdgeInsets.symmetric(
                //                   vertical: Get.height * 0.01),
                //               physics: const BouncingScrollPhysics(),
                //               itemBuilder: (context, index) {
                //                 return MessageCard(message: _msgController.list[index]);
                //               },
                //             );
                //           } else {
                //             return const Center(
                //                 child: Text('Say Hii ... 🤭',
                //                     style: TextStyle(fontSize: 20)));
                //           }
                //       }
                //     },
                //   ),
                // ),

                Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('messages')
                          .doc(_msgController.chatRoomId.value)
                          .collection('chat')
                          .orderBy('sent')
                          .snapshots(),
                      builder: (context, snapshot) {
                        // print(
                        //     "${auth.currentUser!.uid}${_msgController.userId.value}");
                        if (snapshot.hasData) {
                          print('chat screen');
                          return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                // _msgController.viewMoreButtonLength.value =
                                //     snapshot.data!.docs.length;

                                // print(
                                //     _msgController.viewMoreButtonLength.value);
                                DocumentSnapshot doc =
                                    snapshot.data!.docs[index];

                                // if (_msgController
                                //     .servicePriceOnChatOffer.isEmpty) {
                                //   _buttonController.disableOffer.value = true;
                                //   print('empty');
                                // } else
                                if (doc['type'] == 'offer' &&
                                    _buttonController.fromProductScreen.value ==
                                        true) {
                                  placeorderController.serviceDesc
                                      .add(doc['service description']);
                                  if (doc['accept'] == 'true') {
                                    _buttonController.acceptOfferList[index] =
                                        true;
                                  }
                                } else if (doc['type'] == 'offer' &&
                                    _buttonController.fromProductScreen.value ==
                                        false) {
                                  _msgController.serviceNameOnChatOffer.value =
                                      doc['package'];
                                  if (doc['accept'] == 'true') {
                                    _buttonController.acceptOfferList[index] =
                                        true;
                                  }
                                  print('off');

                                  if (doc['amount'].length == 3) {
                                    _msgController.servicePriceOnChatOffer
                                        .add(int.parse(doc['amount']));
                                    _msgController.servicePriceOnChatOffer
                                        .add(int.parse(doc['amount']) + 100);
                                    _msgController.servicePriceOnChatOffer
                                        .add(int.parse(doc['amount']) + 200);
                                  } else if (doc['amount'].length == 4) {
                                    _msgController.servicePriceOnChatOffer
                                        .add(int.parse(doc['amount']));
                                    _msgController.servicePriceOnChatOffer
                                        .add(int.parse(doc['amount']) + 200);
                                    _msgController.servicePriceOnChatOffer
                                        .add(int.parse(doc['amount']) + 300);
                                  } else if (doc['amount'].length == 5) {
                                    _msgController.servicePriceOnChatOffer
                                        .add(int.parse(doc['amount']));
                                    _msgController.servicePriceOnChatOffer
                                        .add(int.parse(doc['amount']) + 1000);
                                    _msgController.servicePriceOnChatOffer
                                        .add(int.parse(doc['amount']) + 2000);
                                  } else if (doc['amount'].length == 6) {
                                    _msgController.servicePriceOnChatOffer
                                        .add(int.parse(doc['amount']));
                                    _msgController.servicePriceOnChatOffer
                                        .add(int.parse(doc['amount']) + 10000);
                                    _msgController.servicePriceOnChatOffer
                                        .add(int.parse(doc['amount']) + 20000);
                                  }
                                }

                                print('message cards');
                                return doc['type'] == 'text'
                                    ? MessageCard(
                                        serviceName: ' ',
                                        sendby: doc['sendby'],
                                        index: index,
                                        message: MessageModel(
                                            msg: doc['msg'],
                                            toID: _msgController.userId.value,
                                            read: '121',
                                            type: MsgType.text,
                                            fromID: auth.currentUser!.uid,
                                            sent: doc['sent']),
                                      )
                                    : MessageCard(
                                        serviceName: doc['package'],
                                        sendby: doc['sendby'],
                                        index: index,
                                        message: MessageModel(
                                            msg: doc['amount'],
                                            toID: _msgController.userId.value,
                                            read: doc['details'],
                                            type: MsgType.offer,
                                            fromID: auth.currentUser!.uid,
                                            sent: doc['sent']),
                                      );
                                // : MessageCard(
                                //     index: doc['sendby'],
                                //     message: MessageModel(
                                //         msg: doc['msg'],
                                //         toID: '121',
                                //         read: '121',
                                //         type: MsgType.offer,
                                //         fromID: '121',
                                //         sent: '212'),
                                //   );
                              });
                        }
                        if (_msgController.servicePriceOnChatOffer.isEmpty) {
                          _buttonController.disableOffer.value = true;
                        }
                        return Container();
                      }),
                ),

                //  (_msgController.list.isNotEmpty)
                //     ? ListView.builder(
                //         reverse: true,
                //         itemCount: _msgController.list.length,
                //         padding: EdgeInsets.symmetric(
                //             vertical: Get.height * 0.01),
                //         // physics: const BouncingScrollPhysics(),
                //         itemBuilder: (context, index) {
                //           return MessageCard(
                //             message: _msgController.list[index],
                //             index: auth.currentUser!.uid,
                //           );
                //         },
                //       )
                //     : const Center(
                //         child: Text('Say Hii ... 🤭',
                //             style: TextStyle(fontSize: 20))),

                if (isUploading)
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                SizedBox(height: Get.height * .01),

                OfferToggler(sendby: auth.currentUser!.displayName.toString()),

                Obx(
                  () => !_buttonController.isExpanded.value
                      ? _chatInput()
                      : const SizedBox(),
                )
                // if (_showEmoji)
                //   SizedBox(
                //     height: Get.height * .35,
                //     child: EmojiPicker(
                //       textEditingController: _textController,
                //       config: Config(
                //         columns: 7,
                //         emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                //       ),
                //     ),
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Row(
      children: [
        //Back Button
        IconButton(
          onPressed: () {
            _msgController.servicePriceOnChatOffer.clear();
            Get.back();
          },
          icon: const Icon(CupertinoIcons.back),
          color: AppColors.black,
        ),
        Stack(
          children: [
            Positioned(
              child: Container(
                margin: const EdgeInsets.all(0),
                child: const CircleAvatar(
                  backgroundColor: AppColors.appBar,
                  child: Icon(
                    CupertinoIcons.person,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 25,
              bottom: 0,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF43FD6C),
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.name,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey),
                ),
                const SizedBox(width: 2),
                // Text(
                //   widget.user.isOnline.toString(),
                //   style: TextStyle(color: AppColors.grey, fontSize: 12),
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _chatInput() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.025, vertical: Get.height * .01),
      child: Row(
        children: [
          //!Input Field & Buttons
          Expanded(
            child: Row(
              children: [
                //Icon Button
                IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    setState(() => _sendFile = !_sendFile);
                  },
                  icon: const Icon(Icons.add, size: 26),
                  color: AppColors.black,
                ),
                SizedBox(
                  width: Get.width * .03,
                ),
                //Expanded to specify TextField width
                Expanded(
                  child: TextField(
                    controller: _textController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onTap: () {
                      if (_sendFile) {
                        setState(() => _sendFile = !_sendFile);
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Message ...',
                      hintStyle: TextStyle(color: AppColors.grey),
                    ),
                  ),
                ),

                SizedBox(width: Get.width * .02)
              ],
            ),
          ),
          //Message Send button
          MaterialButton(
              minWidth: 0,
              onPressed: () async {
                _msgController.list.clear();
                if (_textController.text.isNotEmpty) {
                  final Map<String, dynamic> message1 = {
                    'msg': _textController.text,
                    'toID': _msgController.userId.value,
                    'read': 'true',
                    'sendby': auth.currentUser!.displayName.toString(),
                    'fromID': auth.currentUser!.uid,
                    'sent': DateTime.now().millisecondsSinceEpoch.toString(),
                    'type': 'text',
                    // 'type':
                  };
                  await FirebaseFirestore.instance
                      .collection('messages')
                      .doc(_msgController.chatRoomId.value)
                      .set(
                    {
                      'test': '12',
                    },
                    SetOptions(merge: true),
                  );
                  await FirebaseFirestore.instance
                      .collection('messages')
                      .doc(_msgController.chatRoomId.value)
                      .collection('chat')
                      .doc()
                      .set(message1);

                  await FirebaseFirestore.instance
                      .collection('User')
                      .doc(auth.currentUser!.uid)
                      .set(
                    {
                      'lastActive':
                          DateTime.now().millisecondsSinceEpoch.toString(),
                    },
                    SetOptions(merge: true),
                  );

                  print('sent');
                  _textController.text = '';
                  //Add the send logic
                }
              },
              // color: Theme.of(context).primaryColor,
              shape: const CircleBorder(),
              padding: const EdgeInsets.only(
                  bottom: 10, right: 5, left: 10, top: 10),
              child: Icon(
                Icons.near_me_rounded,
                color: AppColors.pink,
              )
              // SvgPicture.asset(
              //   'assets/icons/send.svg',

              //   color: Colors.grey,
              // ),
              )
        ],
      ),
    );
  }
}
