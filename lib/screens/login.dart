import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widget/button.dart';
import '../widget/googleButton.dart';
import '../widget/heading.dart';
import '../widget/subheading.dart';
import '../widget/textfield.dart';
import '../widget/passwordfield.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFFAFAFA),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(0.0),
                margin: EdgeInsets.fromLTRB(0.0, height * 0.04, 0.0, 0.0),
                child: logo(width: width * 0.9, height: height * 0.15),
              ),
              heading(
                title: 'Welcome Back',
                heightFromTop: height * 0.008,
                fontSize: width * 0.11,
              ),
              subHeading(
                title: "Welcome back, you've been missed.",
                fontSize: width * 0.04,
              ),
              Container(
                height: height * 0.07,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.03, 0.0, 0.0),
                child: textFormField(title: 'Email'),
              ),
              Container(
                height: height * 0.07,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.03, 0.0, 0.0),
                child: PasswordField(title: 'Password'),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.01,
                    width: width * 0.08,
                    child: Checkbox(
                      activeColor: Color(0xFFCB585A),
                      side: BorderSide(
                        color: Color(0xFFCB585A),
                        width: 2.0,
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xFFCB585A),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 0.0),
                    child: Text(
                      'Remember me',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontFamily: constant.font,
                        // fontWeight: FontWeight.w700,
                        color: Color(0xFF464646),
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontFamily: constant.font,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFCB585A),
                      fontSize: width * 0.04,
                    ),
                  ),
                ],
              ),
              Container(
                width: width * 0.4,
                height: height * 0.06,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.04, 0.0, 0.0),
                child: button(label: 'Login'),
              ),
              SizedBox(height: height * 0.03),
              Row(
                children: [
                  Expanded(
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
                      color: Color(0xff555555),
                      fontFamily: constant.font,
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.04,
                    ),
                  ),
                  Expanded(
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
              googleButton(),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: Color(0xFF555555),
                      fontFamily: constant.font,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        color: Color(0xFFCB585A),
                        fontFamily: constant.font,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
