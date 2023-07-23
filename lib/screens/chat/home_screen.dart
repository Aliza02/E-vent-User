import 'package:flutter/cupertino.dart.';
import 'package:flutter/material.dart';
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
  //!for storing All users
  final List<ChatUser> _list = [
    ChatUser(
      name: "John",
      about: "Hello, I'm John!",
      lastActive: "1685782402018",
      id: "1",
      isOnline: true,
      pushToken: "ABC123",
      email: "john@example.com",
    ),
    ChatUser(
      name: "Alice",
      about: "Hi, I'm Alice!",
      lastActive: "1685782402018",
      id: "2",
      isOnline: false,
      pushToken: "DEF456",
      email: "alice@example.com",
    ),
    ChatUser(
      name: "Bob",
      about: "Hey, I'm Bob!",
      lastActive: "1685782402018",
      id: "3",
      isOnline: true,
      pushToken: "GHI789",
      email: "bob@example.com",
    ),
  ];
  //!for storing searched items
  final List<ChatUser> _searchlist = [];
  //!for storing search status
  bool _isSearching = false;

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
                // Get.back();
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
            child: (_list.isNotEmpty)
                ? ListView.builder(
                    // itemCount: _isSearching ? _searchlist.length : _list.length,
                    itemCount: _isSearching ? _searchlist.length : _list.length,
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ChatUserCard(
                          user:
                              _isSearching ? _searchlist[index] : _list[index]);
                    },
                  )
                : const Center(
                    child: Text(
                      'No Connections found.',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
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
          