import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';
import '../../controllers/message_controller.dart';
import '../../controllers/offer_btn_controller.dart';
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
  // final ButtonController _buttonController = Get.put(ButtonController());
  // final MessageController _msgController = Get.put(MessageController());

  final ButtonController _buttonController = Get.find<ButtonController>();
  final MessageController _msgController = Get.find<MessageController>();
  // _showEmoji for showing the value of showing or hiding emoji
  //_isUploading for checking if image is uploading or not
  bool _sendFile = false;
  bool isUploading = false;

  //for handling text message changes
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          appBar: AppBar(
              shape: Border(
                bottom: BorderSide(
                  color: Color(
                      constant.red), // Change the color to your desired color
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
                Obx(
                  () => Expanded(
                    child: (_msgController.list.isNotEmpty)
                        ? ListView.builder(
                            reverse: true,
                            itemCount: _msgController.list.length,
                            padding: EdgeInsets.symmetric(
                                vertical: Get.height * 0.01),
                            // physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return MessageCard(
                                message: _msgController.list[index],
                                index: index,
                              );
                            },
                          )
                        : const Center(
                            child: Text('Say Hii ... 🤭',
                                style: TextStyle(fontSize: 20))),
                  ),
                ),
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
                OfferToggler(),
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
          onPressed: () => Navigator.pop(context),
          icon: const Icon(CupertinoIcons.back),
          color: Color(constant.icon),
        ),
        Stack(
          children: [
            Positioned(
              child: Container(
                margin: const EdgeInsets.all(0),
                child: CircleAvatar(
                  backgroundColor: Color(constant.lightPink),
                  child: Icon(
                    CupertinoIcons.person,
                    color: Color(constant.grey),
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
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(constant.grey)),
                ),
                const SizedBox(width: 2),
                Text(
                  'Online',
                  style: TextStyle(color: Color(constant.grey), fontSize: 12),
                ),
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
                  color: Color(constant.icon),
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
                      hintStyle: TextStyle(color: Color(constant.grey)),
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
              onPressed: () {
                if (_textController.text.isNotEmpty) {
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
                color: Color(constant.red),
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
