import 'package:eventually_user/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/constant.dart';
import '../controllers/signup_controller.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore store = FirebaseFirestore.instance;
final signupcontroller = Get.put(SignupController());
UserCredential? userCredentials;
User? user;

// var user;

Future signup(
    {required String email,
    required String name,
    required String password,
    required String confirmPassword,
    required String phone}) async {
  try {
    signupcontroller.successfullSignup.value = true;
    userCredentials = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredentials?.user;

    if (user != null) {
      user?.updateDisplayName(name);
      user?.updateEmail(email);
      user?.updatePassword(password);

      await user?.reload();
    }

    await store.collection('User').doc(auth.currentUser?.uid).set({
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'Phone': phone,
    });
    signupcontroller.successfullSignup.value = false;
    Get.toNamed(NamedRoutes.drawer);
  } on FirebaseException catch (e) {
    signupcontroller.successfullSignup.value = false;
    switch (e.code) {
      case "email-already-in-use":
        Get.showSnackbar(
          GetSnackBar(
            title: 'Email Already Exists',
            message: 'The email you entered is currently in use. Try Again.',
            backgroundColor: Constant.pink,
            duration: const Duration(seconds: 4),
            icon: const Icon(Icons.incomplete_circle_rounded),
          ),
        );
        break;
    }

    Get.toNamed(NamedRoutes.signup);

    print(e);
  }
}

Future Signout() async {
  await auth.signOut();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('rememberMe', false);
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
