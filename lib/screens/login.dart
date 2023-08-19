//!Flutter packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//!project headers
import '../constants/constant.dart';
import '../routes.dart';
import '../widget/logo.dart';
import '../widget/button.dart';
import '../widget/google_button.dart';
import '../widget/heading.dart';
import '../widget/subheading.dart';
import '../widget/textfield.dart';
import '../widget/passwordfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFFAFAFA),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(0.0),
                margin: EdgeInsets.fromLTRB(0.0, Get.height * 0.04, 0.0, 0.0),
                child: Logo(width: Get.width * 0.9, height: Get.height * 0.15),
              ),
              Heading(
                title: 'Welcome Back',
                heightFromTop: Get.height * 0.008,
                fontSize: Get.width * 0.11,
              ),
              SubHeading(
                title: "Welcome back, you've been missed.",
                fontSize: Get.width * 0.04,
              ),
              Container(
                height: Get.height * 0.07,
                margin: EdgeInsets.fromLTRB(0.0, Get.height * 0.03, 0.0, 0.0),
                child: CustomTextFormField(
                  title: 'Email',
                  // controller: Get.put,
                ),
              ),
              Container(
                height: Get.height * 0.07,
                margin: EdgeInsets.fromLTRB(0.0, Get.height * 0.03, 0.0, 0.0),
                child: PasswordField(title: 'Password'),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                    width: Get.width * 0.08,
                    child: Checkbox(
                      activeColor: const Color(0xFFCB585A),
                      side: const BorderSide(
                        color: Color(0xFFCB585A),
                        width: 2.0,
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
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
                  SizedBox(
                    // margin: EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 0.0),
                    child: Text(
                      'Remember me',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Get.width * 0.04,
                        fontFamily: constant.font,
                        // fontWeight: FontWeight.w700,
                        color: const Color(0xFF464646),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(NamedRoutes.forgetpassword);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontFamily: constant.font,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFCB585A),
                        fontSize: Get.width * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: Get.width * 0.4,
                height: Get.height * 0.06,
                margin: EdgeInsets.fromLTRB(0.0, Get.height * 0.04, 0.0, 0.0),
                child: InkWell(
                  // onTap: (){
                  //   Get.toNamed(NamedRoutes.homepage);
                  // },
                  child: Button(
                    label: 'Login',
                    onPressed: () {
                      Get.toNamed(NamedRoutes.homepage);
                    },
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.03),
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
                      fontSize: Get.width * 0.04,
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
              SizedBox(
                height: Get.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyle(
                      fontSize: Get.width * 0.04,
                      color: const Color(0xFF555555),
                      fontFamily: constant.font,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(NamedRoutes.signup);
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: Get.width * 0.04,
                        color: const Color(0xFFCB585A),
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
