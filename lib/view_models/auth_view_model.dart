import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/views/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passController;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference userRef = FirebaseFirestore.instance.collection("users");
  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();

    super.onInit();
  }

  Future<void> signUp() async {
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController!.text, password: passController!.text)
        .then((value) {
      if (value != null) {
        userModel user = userModel(
            id: value.user!.uid,
            name: nameController!.text,
            password: passController!.text,
            email: emailController!.text);
        userRef.doc(value.user!.uid).set(user.toMap()).then((value) {
          Get.snackbar('Success', "Signed Up");
        });
      }
    }).catchError((e) {
      Get.snackbar("error", e.toString(),
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    });
  }

  Future<void> signIn() async {
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailController!.text, password: passController!.text)
        .then((value) {
      if (value != null) {
        Get.snackbar("Sucess", "Signed in Sucessfully");
        Get.off(HomeView());
      }
    }).catchError((e) {
      Get.snackbar("error", e.toString(),
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    });
  }

  // void SignInWithGoogle() async {
  //   googleSignInAccount = await googleSignIn.signIn();
  //   if (googleSignInAccount != null) {
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount!.authentication;
  //     final AuthCredential authCredential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);

  //     UserCredential result =
  //         await firebaseAuth.signInWithCredential(authCredential);
  //     User? user = result.user;

  //     if (result != null) {
  //       Get.offAll(HomeView());
  //     }
  //   }
  // }
}
