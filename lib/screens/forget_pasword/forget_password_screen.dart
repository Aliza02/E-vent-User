import 'package:eventually_user/widget/button.dart';
import 'package:eventually_user/widget/heading.dart';
import 'package:eventually_user/widget/subheading.dart';
import 'package:eventually_user/widget/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constant.dart';
import '../../widget/googleButton.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  // TextStyle(fontFamily: constant.font)
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
              heading(title: 'Forgot Password', heightFromTop: 0, fontSize: 28),
          leading: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(50),
            child: const Icon(CupertinoIcons.back),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/forget_pasword.svg'),
                  subHeading(
                    title: 'Forgot password? No worries, lets recover it',
                    fontSize: 18,
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  textFormField(title: 'enter Email'),
                  SizedBox(height: height * .02),
                  button(label: 'Enter'),
                  SizedBox(height: height * .015),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Color(0xFFCB585A),
                          height: 20.0,
                          thickness: 2,
                          indent: 9,
                          endIndent: 9,
                        ),
                      ),
                      Text(
                        'or continue with',
                        style: TextStyle(
                          color: const Color(0xff555555),
                          fontFamily: constant.font,
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.04,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Color(0xFFCB585A),
                          height: 20.0,
                          thickness: 2,
                          indent: 9,
                          endIndent: 9,
                        ),
                      ),
                    ],
                  ),
                  const GoogleButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
