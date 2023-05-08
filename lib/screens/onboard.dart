import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:eventually_user/models/onboardpage_model.dart';

import '../constants/constant.dart';

class onboard extends StatefulWidget {
  const onboard({super.key});

  @override
  State<onboard> createState() => _onboardState();
}

class _onboardState extends State<onboard> {
  int currentindex = 0;
  PageController? _pagescontroller;

  void initState() {
    super.initState();
    _pagescontroller = PageController(initialPage: 0);
  }

  void dispose() {
    _pagescontroller!.dispose();
    super.dispose();
  }

  Container buildDot(int index, BuildContext context, int color) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.015,
      width: MediaQuery.of(context).size.width * 0.034,
      // currentindex == index
      //     ? MediaQuery.of(context).size.width * 0.1
      //     : MediaQuery.of(context).size.width * 0.05,
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.008),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: currentindex == index ? Color(color) : Color(0xFFD9D9D9),
        // currentindex == index
        //     ? Colors.white
        //     : Colors.grey.withOpacity(0.4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView.builder(
          controller: _pagescontroller,
          itemCount: content.length,
          onPageChanged: (int index) {
            setState(() {
              currentindex = index;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(width * 0.41, 0.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      Row(
                        children: List.generate(
                          content.length,
                          (index) => buildDot(
                              index, context, constant.pageIndicator[index]),
                        ),
                      ),
                      currentindex < content.length - 1
                          ? Container(
                              margin:
                                  EdgeInsets.fromLTRB(width * 0.2, 0, 0.0, 0.0),
                              padding: EdgeInsets.all(width * 0.01),
                              child: TextButton(
                                onPressed: () {
                                  _pagescontroller?.jumpToPage(2);
                                },
                                child: Text(
                                  'skip',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: constant.font,
                                    fontSize: width * 0.05,
                                  ),
                                ),
                              ))
                          : Container(
                              height: MediaQuery.of(context).size.height * 0.01,
                              width: MediaQuery.of(context).size.width * 0.03,
                              margin: EdgeInsets.fromLTRB(
                                  0.0,
                                  MediaQuery.of(context).size.width * 0.1,
                                  0.0,
                                  0.0),
                              padding: EdgeInsets.all(width * 0.01),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, height * 0.01, 0.0, 0.0),
                  child: Image.asset(
                    content[index].image,
                    height: height * 0.4,
                    width: width * 0.9,
                  ),
                ),
                Container(
                  height: height * 0.17,
                  margin: EdgeInsets.fromLTRB(0.0, height * 0.1, 0.0, 0.0),
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  alignment: Alignment.center,
                  child: Text(
                    content[index].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: width * 0.05,
                      fontFamily: constant.font,
                    ),
                  ),
                ),
                currentindex == content.length - 1
                    ? Container(
                        width: width * 0.7,
                        height: height * 0.08,
                        // alignment: Alignment.center,
                        margin:
                            EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFC6F988),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/signin');
                          },
                          child: Text(
                            'Plan Your First Event',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: constant.font,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.05,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        margin:
                            EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: Color(constant.pageIndicator[currentindex]),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _pagescontroller?.nextPage(
                                duration: Duration(milliseconds: 10),
                                curve: Curves.bounceOut);
                          },
                          child: Center(
                            child: Image.asset(
                              "assets/images/arrow.png",
                              width: width * 0.6,
                              height: height * 0.1,
                            ),
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
