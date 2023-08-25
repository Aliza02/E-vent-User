//!Flutter packages
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//!project headers
import '../constants/colors.dart';
import '../constants/constant.dart';
import '../controllers/login_controller.dart';
import '../firebaseMethods/userAuthentication.dart';
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

  final logincontroller = Get.put(LoginController());

  saveRememberMeStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', value);
  }

  Future<void> _login() async {
    try {
      logincontroller.isLoggedIn.value = true;
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: logincontroller.emailController.text,
              password: logincontroller.passwordController.text);

      if (userCredential.user != null) {
        if (logincontroller.isRemember.value) {
          saveRememberMeStatus(true);
          Get.toNamed('/drawer');
        }
        Get.toNamed('/drawer');
      }

      logincontroller.isLoggedIn.value = false;
    } on FirebaseAuthException catch (e) {
      print('Failed to log in: ${e.message}');
    }
  }

  void validate() async {
    if (logincontroller.emailController.text.isEmpty ||
        logincontroller.passwordController.text.isEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Incomplete Fields',
          message: 'Enter complete details ',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else if (EmailValidator.validate(logincontroller.emailController.text) ==
        false) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Incorrect Email Format',
          message: 'Enter a correct email',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else {
      _login();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  textcontroller: logincontroller.emailController,
                  title: 'Email',
                  // controller: Get.put,
                ),
              ),
              Container(
                height: Get.height * 0.07,
                margin: EdgeInsets.fromLTRB(0.0, Get.height * 0.03, 0.0, 0.0),
                child: PasswordField(
                    title: 'Password',
                    passwordController: logincontroller.passwordController),
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
                          logincontroller.isRemember.value = value;
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
              Obx(
                () => Container(
                  width: Get.width * 0.4,
                  height: Get.height * 0.06,
                  margin: EdgeInsets.fromLTRB(0.0, Get.height * 0.04, 0.0, 0.0),
                  child: logincontroller.isLoggedIn.value == true
                      ? const SpinKitFadingCircle(
                          color: AppColors.pink,
                        )
                      : Button(
                          label: 'Login',
                          onPressed: () async {
                            Get.toNamed('/drawer');
                            // validate();
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
              InkWell(
                  onTap: () {
                    signInWithGoogle();
                  },
                  child: const GoogleButton()),
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
