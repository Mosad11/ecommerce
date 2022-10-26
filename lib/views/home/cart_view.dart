import 'package:ecommerce/helpers/constance.dart';
import 'package:ecommerce/view_models/cart_view_model.dart';
import 'package:ecommerce/views/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetWidget<CartViewModel> {
  CartView({Key? key}) : super(key: key);
  final controller = Get.put(CartViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<CartViewModel>(
      builder: (cont) => Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.height,
            child: controller.cartProducts.isEmpty
                ? const Center(
                    child: Text("The Cart is Empty"),
                  )
                : ListView.builder(
                    itemCount: controller.cartProducts.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) {
                          controller.delete(controller.cartProducts[index].id!);
                        },
                        background: Container(
                          color: Colors.red,
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                          ),
                        ),
                        // onLongPress: () {
                        //   Get.defaultDialog(
                        //       title: 'Attention',
                        //       content:
                        //           Text("Do you want to delete this item ?"),
                        //       actions: [
                        //         TextButton(
                        //             onPressed: () {
                        //               controller.delete(
                        //                   controller.cartProducts[index].id!);
                        //               Get.back();
                        //             },
                        //             child: Text("Yes")),
                        //         TextButton(
                        //             onPressed: () {
                        //               Get.back();
                        //             },
                        //             child: Text("No")),
                        //       ]);
                        // },
                        child: SizedBox(
                          height: Get.height * 120 / 812,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(children: [
                              Image.network(
                                controller.cartProducts[index].image,
                                fit: BoxFit.cover,
                                height: Get.height * 120 / 812,
                                width: Get.height * 120 / 812,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.cartProducts[index].name,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '\$${controller.cartProducts[index].price}',
                                    style: const TextStyle(
                                        fontSize: 16, color: primaryColor),
                                  ),
                                  Container(
                                    height: Get.height * 30 / 812,
                                    width: Get.width * 95 / 375,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              controller.increase(index);
                                            },
                                            child: const Icon(Icons.add)),
                                        Text(controller
                                            .cartProducts[index].count
                                            .toString()),
                                        InkWell(
                                            onTap: () {
                                              controller.decrease(index);
                                            },
                                            child: Icon(Icons.remove)),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ]),
                          ),
                        ),
                      );
                    }),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                color: Colors.white,
                width: Get.width,
                height: Get.height * 84 / 812,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Total "),
                        Text(
                          "\$${controller.total}",
                          style: const TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(CheckOutView());
                      },
                      child: const Text("CheckOut",
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              Get.width * 146 / 375, Get.height * 50 / 812)),
                    )
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
