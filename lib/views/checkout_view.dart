import 'dart:ui';

import 'package:ecommerce/helpers/constance.dart';
import 'package:ecommerce/helpers/cut_helper.dart';
import 'package:ecommerce/view_models/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class CheckOutView extends GetWidget<CartViewModel> {
  CheckOutView({Key? key}) : super(key: key);
  PageController pageController = PageController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (cont) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(Get.width, Get.height * 0.1),
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Text(
                  currentPage == 2 ? 'Summary' : 'CheckOut',
                  style: const TextStyle(color: Colors.black),
                ),
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  ListView(
                    children: [
                      const SizedBox(height: 20),
                      ListTile(
                        title: const Text(
                          "Standard Delivery",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                            "Order will be delivered between 3 - 5 business days"),
                        leading: Radio(
                          value: 'Standard',
                          groupValue: cont.radioV,
                          onChanged: (value) {
                            cont.radioV = value.toString();
                            cont.update();
                          },
                          activeColor: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListTile(
                        title: const Text(
                          "Next Day Delivery",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                            "Place your order before 6pm and your items will be delivered the next day"),
                        leading: Radio(
                          value: 'Next',
                          groupValue: cont.radioV,
                          onChanged: (value) {
                            cont.radioV = value.toString();
                            cont.update();
                          },
                          activeColor: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListTile(
                        title: const Text(
                          "Nominated Delivery",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                            "Pick a particular date from the calendar and order will be delivered on selected date"),
                        leading: Radio(
                          value: 'Nominated',
                          groupValue: cont.radioV,
                          onChanged: (value) {
                            cont.radioV = value.toString();
                            cont.update();
                          },
                          activeColor: primaryColor,
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      bottom: Get.height * 20 / 812,
                      right: Get.width * 20 / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          currentPage = 1;
                          controller.update();
                          pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOutQuint);
                        },
                        child: const Text("Next",
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                Get.width * 146 / 375, Get.height * 50 / 812)),
                      ))
                ],
              ),
            ),
            Container(
                height: Get.height,
                width: Get.width,
                color: Colors.white,
                child: Stack(
                  children: [
                    Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(height: Get.height * 0.05),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset('assets/check.png'),
                                const SizedBox(width: 10),
                                const Text(
                                    "Billing address is the same as delivey address")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  children: const [Text("Street")],
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill the field';
                                    }
                                    return null;
                                  },
                                  controller: controller.streetCont,
                                  decoration: const InputDecoration(
                                      hintText: "21, Alex Davidson Avenue"),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  children: const [Text("City")],
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill the field';
                                    }
                                    return null;
                                  },
                                  controller: controller.cityCont,
                                  decoration: const InputDecoration(
                                      hintText: "Victoria island"),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: const [Text("State")],
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please fill the field';
                                          }
                                          return null;
                                        },
                                        controller: controller.stateCont,
                                        decoration: const InputDecoration(
                                            hintText: "Victoria island"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: const [Text("Country")],
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please fill the field';
                                          }
                                          return null;
                                        },
                                        controller: controller.countryCont,
                                        decoration: const InputDecoration(
                                            hintText: "Victoria island"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.1,
                          )
                        ]),
                      ),
                    ),
                    Positioned(
                        bottom: Get.height * 20 / 812,
                        right: Get.width * 20 / 375,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              currentPage = 2;
                              controller.update();
                              pageController.animateToPage(2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOutQuint);
                            }
                          },
                          child: const Text("Next",
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(Get.width * 146 / 375,
                                  Get.height * 50 / 812)),
                        )),
                    Positioned(
                        bottom: Get.height * 20 / 812,
                        left: Get.width * 20 / 375,
                        child: ElevatedButton(
                          onPressed: () {
                            currentPage = 0;
                            controller.update();
                            pageController.animateToPage(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOutQuint);
                          },
                          child: const Text("Back",
                              style: TextStyle(color: Colors.black)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 0,
                              side: const BorderSide(color: primaryColor),
                              fixedSize: Size(Get.width * 146 / 375,
                                  Get.height * 50 / 812)),
                        ))
                  ],
                )),
            Container(
              height: Get.height,
              width: Get.width,
              color: Colors.white,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.1,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: Get.height * 200 / 812,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cont.cartProducts.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            cont.cartProducts[index].image,
                                            height: Get.width * 120 / 375,
                                            width: Get.width * 120 / 375,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: Get.width * 120 / 375,
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 3),
                                                      child: Text(
                                                        cutString(
                                                            cont
                                                                .cartProducts[
                                                                    index]
                                                                .name,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        16)),
                                                      ),
                                                    ),
                                                    Text(
                                                      "\$${cont.cartProducts[index].price * cont.cartProducts[index].count}",
                                                      style: const TextStyle(
                                                          color: primaryColor),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Text(
                                                  "x${cont.cartProducts[index].count}",
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            ListTile(
                              title: const Text(
                                "Shipping Address",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  "${cont.streetCont!.text},${cont.cityCont!.text},${cont.stateCont!.text},${cont.countryCont!.text}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                  )),
                              trailing: Image.asset('assets/check.png'),
                            ),
                            const Divider(
                              thickness: 1,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: Get.height * 20 / 812,
                      right: Get.width * 20 / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.sendOrder();
                        },
                        child: const Text("Deliver",
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                Get.width * 146 / 375, Get.height * 50 / 812)),
                      )),
                  Positioned(
                      bottom: Get.height * 20 / 812,
                      left: Get.width * 20 / 375,
                      child: ElevatedButton(
                        onPressed: () {
                          currentPage = 1;
                          controller.update();
                          pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOutQuint);
                        },
                        child: const Text("Back",
                            style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0,
                            side: const BorderSide(color: primaryColor),
                            fixedSize: Size(
                                Get.width * 146 / 375, Get.height * 50 / 812)),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
