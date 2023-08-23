import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../OTPMethods/otpMethods.dart';
import '../controllers/signup_controller.dart';
import '../firebasemethods/userAuthentication.dart';
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

  final signupcontroller = Get.put(SignupController());
  late Timer timer;
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (signupcontroller.secondsRemainingforOtp.value > 0) {
          signupcontroller.secondsRemainingforOtp.value--;
        } else {
          timer.cancel();
          signupcontroller.secondsRemainingforOtp.value = 59;
          generateOtp();
        }
      });
    });
  }

  void validation() async {
    if (signupcontroller.passwordController.text.isEmpty ||
        signupcontroller.confirmPasswordController.text.isEmpty ||
        signupcontroller.emailController.text.isEmpty ||
        signupcontroller.nameController.text.isEmpty) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Incomplete Fields',
          message: 'Enter complete details ',
          backgroundColor: Constant.pink,
          duration: const Duration(seconds: 2),
          icon: const Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else if (signupcontroller.passwordController.text.toString().length < 6 ||
        signupcontroller.confirmPasswordController.text.toString().length < 6) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Password is too short',
          message: 'Password should be atleast 6 characters',
          backgroundColor: Constant.pink,
          duration: const Duration(seconds: 2),
          icon: const Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else if (EmailValidator.validate(signupcontroller.emailController.text) ==
        false) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Invalid Email',
          message: 'Enter a valid email',
          backgroundColor: Constant.pink,
          duration: const Duration(seconds: 2),
          icon: const Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else if (signupcontroller.phoneController.text.toString().length < 11) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Incorrect Number',
          message: 'Enter correct Number',
          backgroundColor: Constant.pink,
          duration: const Duration(seconds: 2),
          icon: const Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else if (signupcontroller.passwordController.text !=
        signupcontroller.confirmPasswordController.text) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Different Passwords',
          message: 'Password and Confirm Password does not match',
          backgroundColor: Constant.pink,
          duration: const Duration(seconds: 2),
          icon: const Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else if (isChecked == false) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Agreement',
          message: 'Agree to the terms and conditions',
          backgroundColor: Constant.pink,
          duration: const Duration(seconds: 2),
          icon: const Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else {
      startTimer();
      generateOtp();
      // sendOTP();

      print(signupcontroller.OTPCode.value);
      Get.toNamed(NamedRoutes.otpVerification);
    }
  }

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
                child: CustomTextFormField(
                    textcontroller: signupcontroller.nameController,
                    title: 'Full Name'),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: NumberField(
                    phoneController: signupcontroller.phoneController,
                    title: 'Phone Number',
                    maxLength: 11),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: CustomTextFormField(
                    textcontroller: signupcontroller.emailController,
                    title: 'Email'),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: PasswordField(
                    passwordController: signupcontroller.passwordController,
                    title: 'Password'),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: PasswordField(
                    passwordController:
                        signupcontroller.confirmPasswordController,
                    title: 'Confirm Password'),
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
                      validation();
                      print('validate');
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
              InkWell(
                onTap: () {
                  signInWithGoogle();
                },
                child: const GoogleButton(),
              ),
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
