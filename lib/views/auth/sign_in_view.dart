import 'dart:ui';

import 'package:ecommerce/helpers/constance.dart';
import 'package:ecommerce/view_models/auth_view_model.dart';
import 'package:ecommerce/views/auth/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInView extends GetWidget<AuthViewModel> {
  SignInView({Key? key}) : super(key: key);
  final controller = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: Get.height * 0.05,
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("Welcome,",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(SignUpView());
                      },
                      child: const Text("SignUP",
                          style: TextStyle(fontSize: 18, color: primaryColor)),
                    ),
                  ],
                ),
                const Text(
                  "Sign in to Continue",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                SizedBox(
                  height: Get.height * 0.07,
                ),
                const Text(
                  "Email",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                TextFormField(
                  controller: controller.emailController,
                  decoration:
                      const InputDecoration(hintText: 'example@mail.com'),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                const Text(
                  "Password",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                TextFormField(
                  obscureText: true,
                  controller: controller.passController,
                  decoration: const InputDecoration(hintText: 'password'),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: const [Spacer(), Text("Forget Password?")],
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.signIn();
                  },
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize:
                          Size(Get.width * 311 / 375, Get.height * 50 / 812)),
                )
              ],
            ),
          ),
          const Text("-OR-", style: TextStyle(fontSize: 18)),
          SizedBox(
            height: Get.height * 0.03,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: Get.height * 50 / 812,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/facebook.png"),
                  const Text("Sign In With Facebook"),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: Get.height * 50 / 812,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/google.png"),
                  const Text("Sign In With Google"),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
