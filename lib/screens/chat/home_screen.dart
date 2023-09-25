import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_user/constants/colors.dart';
import 'package:eventually_user/constants/font.dart';
import 'package:eventually_user/controllers/message_controller.dart';
import 'package:eventually_user/firebaseMethods/userAuthentication.dart';
import 'package:eventually_user/models/message_model.dart';
import 'package:eventually_user/screens/chat/chat_screen.dart';
import 'package:flutter/cupertino.dart.';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../constants/constant.dart';
import '../../models/chat_user.dart';
import 'widgets/chat_user_card.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  final msgController = Get.put(MessageController());

  //!for storing All users
  final List<ChatUser> _list = [];
  //!for storing searched items
  final List<ChatUser> _searchlist = [];
  //!for storing search status
  bool _isSearching = false;
  // final List<String> chatUserId = [];

  String chatroomId(String vendor, String user) {
    if (vendor.hashCode <= user.hashCode) {
      return '$vendor$user';
    } else {
      return '$user$vendor';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        //!if Search is on then back button simply close the search !the whole app
        onWillPop: () {
          if (_isSearching) {
            setState(() {
              _isSearching = !_isSearching;
            });
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                CupertinoIcons.back,
                color: Color(constant.icon),
              ),
              onPressed: () {
                Get.back();
              },
            ),
            title: _isSearching
                ? TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name, Email, ...',
                    ),
                    autofocus: true,
                    //?When Search text changes then update searchlist
                    onChanged: (value) {
                      //?Search Logic
                      _searchlist.clear();
                      for (var i in _list) {
                        if (i.name
                                .toLowerCase()
                                .contains(value.toLowerCase()) ||
                            i.email
                                .toLowerCase()
                                .contains(value.toLowerCase())) {
                          _searchlist.add(i);
                        }
                        setState(() {
                          _searchlist;
                        });
                      }
                    },
                    style: const TextStyle(fontSize: 17, letterSpacing: 0.5),
                  )
                : Container(),
            actions: [
              //Search User button
              IconButton(
                onPressed: () {
                  setState(() {
                    _isSearching = !_isSearching;
                  });
                },
                icon: Icon(
                  _isSearching
                      ? CupertinoIcons.clear_circled_solid
                      : Icons.search,
                  color: Color(constant.icon),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('messages')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print('has data');
                    // print(_msgController.chatUserId[1]);
                    return msgController.chatUserId.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: _isSearching
                                ? _searchlist.length
                                : msgController.chatUserId.length,
                            itemBuilder: (context, index) {
                              return StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('User')
                                    .doc(msgController.chatUserId[index])
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    _list.add(ChatUser(
                                        name: snapshot.data!['Business Name'],
                                        about: snapshot.data!['email'],
                                        lastActive:
                                            snapshot.data!['lastActive'],
                                        id: 'weqe',
                                        isOnline: false,
                                        pushToken: "oo",
                                        email: snapshot.data!['email']));
                                    return GestureDetector(
                                      onTap: () {
                                        print("abc");

                                        msgController.userName.value =
                                            snapshot.data!['name'];
                                        msgController.businessName.value =
                                            snapshot.data!['Business Name'];
                                        msgController.userId.value =
                                            snapshot.data!['userId'];
                                        String userId = auth.currentUser!.uid;

                                        msgController.chatRoomId.value =
                                            chatroomId(userId,
                                                snapshot.data!['userId']);

                                        print(msgController.chatRoomId.value);

                                        Get.to(
                                          () => ChatScreen(
                                            user: ChatUser(
                                                name: snapshot
                                                    .data!['Business Name'],
                                                about: snapshot.data!['email'],
                                                lastActive: snapshot
                                                    .data!['lastActive'],
                                                id: 'sas',
                                                isOnline: false,
                                                pushToken: "oo",
                                                email: snapshot.data!['email']),
                                          ),
                                        );
                                      },
                                      child: ChatUserCard(
                                          user: _isSearching
                                              ? _searchlist[index]
                                              : _list[index]),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              );
                            })
                        : Center(
                            child: Text(
                              'No chats to display',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontWeight: AppFonts.bold,
                                fontFamily: AppFonts.manrope,
                                fontSize: Get.width * 0.06,
                              ),
                            ),
                          );
                  } else {
                    return const Center(
                      child: SpinKitFadingCircle(
                        color: AppColors.pink,
                      ),
                    );
                  }
                }),

            // child: (_list.isNotEmpty)
            //     ? ListView.builder(
            //         // itemCount: _isSearching ? _searchlist.length : _list.length,
            //         itemCount: _isSearching ? _searchlist.length : _list.length,
            //         padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
            //         physics: const BouncingScrollPhysics(),
            //         itemBuilder: (context, index) {
            //           return ChatUserCard(
            //               user:
            //                   _isSearching ? _searchlist[index] : _list[index]);
            //         },
            //       )
            //     : const Center(
            //         child: Text(
            //           'No Connections found.',
            //           style: TextStyle(fontSize: 20),
            //         ),
            //       ),
          ),
        ),
      ),
    );
  }
}

// TextButton(
//                     child: Text(
//                       'hello',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (_) => ButtonWithBottomContainer()),
//                       );
//                     },),),
