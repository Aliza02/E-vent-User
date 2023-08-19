import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:eventually_user/models/onboardpage_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constant.dart';
import '../routes.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentindex = 0;
  PageController? _pagescontroller;

  @override
  void initState() {
    super.initState();
    _pagescontroller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pagescontroller!.dispose();
    super.dispose();
  }

  _storedonBoaredInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('onboard', isViewed);
  }

  Container buildDot(int index, BuildContext context, int color) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.015,
      width: MediaQuery.of(context).size.width * 0.03,
      // margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.008),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
        shape: BoxShape.circle,
        color: currentindex == index ? Color(color) : const Color(0xFFD9D9D9),
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
                  alignment: Alignment.center,
                  // margin: EdgeInsets.fromLTRB(width * 0.10, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      currentindex > 0
                          ? IconButton(
                              onPressed: () {
                                _pagescontroller?.jumpToPage(currentindex - 1);
                              },
                              icon: const Icon(CupertinoIcons.back),
                            )
                          : SizedBox(
                              width: width * .1,
                            ),
                      Row(
                        children: List.generate(
                          content.length,
                          (index) => buildDot(
                              index, context, constant.pageIndicator[index]),
                        ),
                      ),
                      currentindex < content.length - 1
                          ? Container(
                              // margin:
                              //     EdgeInsets.fromLTRB(width * 0.2, 0, 0.0, 0.0),
                              padding: EdgeInsets.all(width * 0.01),
                              child: InkWell(
                                onTap: () async {
                                  await _storedonBoaredInfo();
                                  _pagescontroller?.jumpToPage(2);
                                },
                                borderRadius:
                                    BorderRadius.circular(width * .15),
                                child: Text(
                                  'skip',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: constant.font,
                                    fontSize: width * 0.05,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: MediaQuery.of(context).size.height * 0.01,
                              width: MediaQuery.of(context).size.width * 0.03,
                              margin: EdgeInsets.fromLTRB(
                                  0.0,
                                  MediaQuery.of(context).size.width * 0.1,
                                  0.0,
                                  0.0),
                              padding: EdgeInsets.all(width * 0.01),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
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
                  padding: EdgeInsets.symmetric(horizontal: width * 0.13),
                  alignment: Alignment.center,
                  child: Text(
                    content[index].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: constant.onboardingFont,
                      color: const Color(0xFF555555),
                      fontSize: width * 0.05,
                    ),
                  ),
                ),
                currentindex == content.length - 1
                    ? Container(
                        width: width * 0.7,
                        height: height * 0.08,
                        margin:
                            EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC6F988),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          onPressed: () async {
                            await _storedonBoaredInfo();
                            Get.toNamed(NamedRoutes.login);
                          },
                          child: Text(
                            'Plan Your First Event',
                            style: TextStyle(
                              color: const Color(0xFF555555),
                              fontFamily: constant.onboardingFont,
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.bold,
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
                          // borderRadius: BorderRadius.circular(
                          //     MediaQuery.of(context).size.width),
                          shape: BoxShape.circle,
                          color: Color(constant.pageIndicator[currentindex]),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            await _storedonBoaredInfo();
                            _pagescontroller?.nextPage(
                                duration: const Duration(milliseconds: 10),
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
