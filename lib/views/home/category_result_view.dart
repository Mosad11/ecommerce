import 'package:ecommerce/models/categories_model.dart';
import 'package:ecommerce/models/product_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/constance.dart';
import '../../view_models/category_result_view_model.dart';
import '../../view_models/explore_view_model.dart';
import 'details_view.dart';

class CategoryResultView extends GetWidget<CategoryResultViewModel> {
  CategoryResultView({Key? key, required this.model}) : super(key: key);
  final controller = Get.put(CategoryResultViewModel());

  ProductModel model;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryResultViewModel>(
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
                        model.category,
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
              body:
                  // RefreshIndicator(
                  //   onRefresh: () async {
                  //     controller.getCategoriesResult(model.category);
                  //   },
                  //   child: controller.resultProductList.isEmpty
                  //       ? const Center(
                  //           child: Text("The Category List is Empty"),
                  //         )
                  //       :
                  Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.60,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: controller.resultProductList.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.network(model.img,
                                  fit: BoxFit.fill,
                                  height: Get.height * 240 / 812,
                                  width: Get.width * 164 / 375),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    model.brand,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ),
                                const Spacer()
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    '\$${model.price}',
                                    style: const TextStyle(
                                        fontSize: 16, color: primaryColor),
                                  ),
                                ),
                                const Spacer()
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
              // ),
            ));
  }
}
