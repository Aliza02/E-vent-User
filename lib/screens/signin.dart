// import 'package:event_user/widgets/button.dart';
// import 'package:event_user/widgets/googlebutton.dart';
// import 'package:event_user/widgets/passwordfield.dart';
// import 'package:event_user/widgets/textformfield.dart';
// import 'package:event_user/constants/constant.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class signin extends StatefulWidget {
//   const signin({super.key});

//   @override
//   State<signin> createState() => _signinState();
// }

// class _signinState extends State<signin> {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   bool loading = false;
//   signinwithGoogle() async {
//     final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication googleauth =
//         await googleuser!.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleauth.accessToken,
//       idToken: googleauth.idToken,
//     );

//     UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithCredential(credential);
//     if (userCredential.user != null) {
//       Navigator.pushNamed(context, '/home');
//     }
//   }

//   void showErrormessage(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Icon(
//           Icons.error,
//           color: Colors.red,
//           size: 50.0,
//         ),
//         content: Text(
//           message,
//           textAlign: TextAlign.center,
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('Ok'),
//           ),
//         ],
//       ),
//     );
//   }

//   void validation() async {
//     if (email.text.isNotEmpty && password.text.isNotEmpty) {
//       setState(() {
//         loading = true;
//       });
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance
//             .signInWithEmailAndPassword(
//                 email: email.text, password: password.text);
//         User user = userCredential.user!;
//         if (user != null) {
//           Navigator.pushNamed(context, '/home');
//         }
//       } on FirebaseAuthException catch (e) {
//         print(e.message);
//       }

//       setState(() {
//         loading = false;
//       });
//     }
//     if (email.text.isEmpty || password.text.isEmpty) {
//       showErrormessage('Enter Credentials to proceed');
//     }
//     email.clear();
//     password.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Color(0xFFFF0FBFB),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               alignment: Alignment.center,
//               height: height * 0.18,
//               child: Text(
//                 'Sign in',
//                 style: TextStyle(
//                   fontFamily: constant.font,
//                   fontSize: width * 0.1,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               padding: EdgeInsets.symmetric(horizontal: width * 0.06),
//               child: Text(
//                 'Welcome back you’ve been missed',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold,
//                   fontSize: width * 0.058,
//                   fontFamily: constant.font,
//                 ),
//               ),
//             ),
//             Container(
//               width: width * 0.8,
//               margin: EdgeInsets.symmetric(vertical: height * 0.05),
//               child: textformfield(
//                 title: 'Email Address',
//                 textcontroller: email,
//               ),
//             ),
//             Container(
//               width: width * 0.8,
//               child: PasswordField(
//                 title: 'Password',
//                 passwordcontroller: password,
//               ),
//             ),
//             Container(
//               width: width * 0.8,
//               alignment: Alignment.centerRight,
//               padding: EdgeInsets.symmetric(vertical: height * 0.02),
//               child: Text(
//                 'Forgot Password?',
//                 style: TextStyle(
//                   fontFamily: constant.font,
//                   fontSize: width * 0.04,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//             Container(
//               width: width * 0.8,
//               height: height * 0.09,
//               margin: EdgeInsets.symmetric(vertical: height * 0.04),
//               child: Button(
//                 name: 'Log in',
//                 bgColor: 0xFFF45C1C1,
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
//             GestureDetector(
//               onTap: signinwithGoogle(),
//               child: Container(
//                 margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
//                 alignment: Alignment.center,
//                 child: GoogleButton(
//                   name: 'Login with Google',
//                   bgColor: 0xFFFFFFFFF,
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Don’t have an account?',
//                     style: TextStyle(
//                       fontSize: width * 0.04,
//                       color: Color(0xFFFABA4A4),
//                       fontFamily: constant.font,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/signup');
//                     },
//                     child: Text(
//                       'Sign up',
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
