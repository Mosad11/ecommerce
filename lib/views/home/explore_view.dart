import 'package:ecommerce/helpers/constance.dart';
import 'package:ecommerce/models/categories_model.dart';
import 'package:ecommerce/view_models/category_result_view_model.dart';
import 'package:ecommerce/view_models/explore_view_model.dart';
import 'package:ecommerce/views/home/category_result_view.dart';
import 'package:ecommerce/views/home/details_view.dart';
import 'package:ecommerce/views/home/image_show_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ExploreView extends GetWidget<ExploreViewModel> {
  ExploreView({Key? key}) : super(key: key);
  final controller = Get.put(ExploreViewModel());
  final Categorycontroller = Get.put(CategoryResultViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: GetBuilder<ExploreViewModel>(
        builder: (cont) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: Get.height * 49 / 812,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.black.withOpacity(0.03),
                ),
                child: const Icon(Icons.search),
                alignment: Alignment.centerLeft,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: Get.height * 95 / 812,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.catList.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                // Categorycontroller.getCategoriesResult(
                                //     Categorycontroller
                                //         .resultProductList[index].category);
                                Get.to(() => CategoryResultView(
                                    model: controller.productList[index]));
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Center(
                                  child: Image.network(
                                      controller.catList[index].img),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(controller.catList[index].name)
                          ],
                        ),
                      );
                    })),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: const [
                    Text(
                      'Best Selling',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'see all',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: Get.height * 319 / 812,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.productList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: (() {
                                  Get.to(DetailsView(
                                      model: controller.productList[index]));
                                }),
                                child: Image.network(
                                    controller.productList[index].img,
                                    fit: BoxFit.fill,
                                    height: Get.height * 240 / 812,
                                    width: Get.width * 164 / 375),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.productList[index].name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    controller.productList[index].brand,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                  Text(
                                    '\$${controller.productList[index].price}',
                                    style: const TextStyle(
                                        fontSize: 12, color: primaryColor),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    )));
  }
}
