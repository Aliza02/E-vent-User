// import 'package:event_user/constants/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:event_user/widgets/passwordfield.dart';
// import 'package:event_user/widgets/textformfield.dart';

// import '../widgets/button.dart';
// import '../widgets/googlebutton.dart';

// class signup extends StatefulWidget {
//   const signup({super.key});

//   @override
//   State<signup> createState() => _signupState();
// }

// class _signupState extends State<signup> {
//   final TextEditingController fullName = TextEditingController();
//   final TextEditingController email = TextEditingController();
//   final TextEditingController password = TextEditingController();
//   final TextEditingController confirmPassword = TextEditingController();
//   void validation() {
//     print('hello');
//     // print(width * 0.058);
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Color(0xFFFFFF7ED),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               alignment: Alignment.center,
//               height: height * 0.13,
//               child: Text(
//                 'Create Account',
//                 style: TextStyle(
//                   fontFamily: constant.font,
//                   fontSize: width * 0.1,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Container(
//               width: width * 0.8,
//               margin: EdgeInsets.symmetric(vertical: height * 0.025),
//               child: textformfield(
//                 title: 'Full Name',
//                 textcontroller: fullName,
//               ),
//             ),
//             Container(
//               width: width * 0.8,
//               margin: EdgeInsets.symmetric(vertical: height * 0.025),
//               child: textformfield(
//                 title: 'Email Address',
//                 textcontroller: email,
//               ),
//             ),
//             Container(
//               width: width * 0.8,
//               margin: EdgeInsets.symmetric(vertical: height * 0.025),
//               child: PasswordField(
//                 title: 'Password',
//                 passwordcontroller: password,
//               ),
//             ),
//             Container(
//               width: width * 0.8,
//               margin: EdgeInsets.symmetric(vertical: height * 0.025),
//               child: PasswordField(
//                 title: 'Confirm Password',
//                 passwordcontroller: confirmPassword,
//               ),
//             ),
//             Container(
//               width: width * 0.8,
//               height: height * 0.09,
//               margin: EdgeInsets.symmetric(vertical: height * 0.025),
//               child: Button(
//                 name: 'Create Account',
//                 bgColor: 0xFFFF57366,
//                 onPressed: validation,
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               child: Text(
//                 '-OR-',
//                 style: TextStyle(
//                   fontSize: width * 0.04,
//                   color: Colors.grey,
//                   fontFamily: constant.font,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
//               alignment: Alignment.center,
//               child: GoogleButton(
//                 name: 'Continue with Google',
//                 bgColor: 0xFFFFFFFFF,
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Already have an account?',
//                     style: TextStyle(
//                       fontSize: width * 0.04,
//                       color: Color(0xFFFABA4A4),
//                       fontFamily: constant.font,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/signin');
//                     },
//                     child: Text(
//                       'Sign in',
//                       style: TextStyle(
//                         fontSize: width * 0.04,
//                         color: Color(0xFFFF57366),
//                         fontFamily: constant.font,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
