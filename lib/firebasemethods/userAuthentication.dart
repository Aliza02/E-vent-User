import 'package:eventually_user/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constant.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore store = FirebaseFirestore.instance;

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
    Get.toNamed(NamedRoutes.drawer);
  } on FirebaseException catch (e) {
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

    print(e);
  }
}

Future signin() async {}
