import 'package:ecommerce/helpers/constance.dart';
import 'package:ecommerce/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  SignUpView({Key? key}) : super(key: key);
  final controller = Get.put(AuthViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: Get.height * 0.07,
          ),
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined)),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Sign Up",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                const Text(
                  "Name",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                TextFormField(
                  controller: controller.nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                SizedBox(
                  height: Get.height * 0.05,
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
                SizedBox(
                  height: Get.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.signUp();
                  },
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize:
                          Size(Get.width * 311 / 375, Get.height * 50 / 812)),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
