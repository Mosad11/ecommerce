import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/categories_model.dart';

import 'package:ecommerce/models/product_model.dart';
import 'package:get/get.dart';

class CategoryResultViewModel extends GetxController {
  List<ProductModel> resultProductList = [];

  CollectionReference resultProductRef =
      FirebaseFirestore.instance.collection('products');
  @override
  void onInit() {
    getCategoriesResult('Women');
    super.onInit();
  }

  getCategoriesResult(String category) async {
    await resultProductRef
        .where('category', isEqualTo: category)
        .get()
        .then((value) {
      for (var i in value.docs) {
        resultProductList.add(ProductModel.fromMap(i));
      }
      update();
    });
  }
}
