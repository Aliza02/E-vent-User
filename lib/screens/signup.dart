import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes.dart';
import '../widget/button.dart';
import '../widget/google_button.dart';
import '../widget/heading.dart';
import '../widget/numberfield.dart';
import '../widget/subheading.dart';
import '../widget/textfield.dart';
import '../widget/passwordfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFFAFAFA),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(0.0),
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: Logo(width: width * 0.4, height: height * 0.08),
              ),
              Heading(
                title: 'Sign Up',
                heightFromTop: height * 0.008,
                fontSize: width * 0.11,
              ),
              SubHeading(
                title: "Create an Account",
                fontSize: width * 0.04,
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: CustomTextFormField(title: 'Full Name'),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: NumberField(title: 'Phone Number', maxLength: 11),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: CustomTextFormField(title: 'Email'),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: PasswordField(title: 'Password'),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: PasswordField(title: 'Confirm Password'),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    height: height * 0.01,
                    width: width * 0.08,
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
                      'I agree to all the term and conditions',
                      style: TextStyle(
                        fontSize: width * 0.03,
                        fontFamily: constant.font,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF464646),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: width * 0.4,
                height: height * 0.06,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.035, 0.0, 0.0),
                child: Button(
                    label: 'Create Account',
                    onPressed: () {
                      Get.toNamed(NamedRoutes.homepage);
                    }),
              ),
              SizedBox(height: height * 0.03),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: const Color(0xFF555555),
                      fontFamily: constant.font,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: width * 0.04,
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
