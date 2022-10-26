import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/categories_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:get/get.dart';

class ExploreViewModel extends GetxController {
  List<CategoriesModel> catList = [];
  List<ProductModel> productList = [];

  CollectionReference catRef =
      FirebaseFirestore.instance.collection('categories');
  CollectionReference productRef =
      FirebaseFirestore.instance.collection('products');

  @override
  void onInit() {
    getCategories();
    getProducts();
    super.onInit();
  }

  void getCategories() async {
    await catRef.orderBy('number', descending: false).get().then((value) {
      for (var i in value.docs) {
        catList.add(CategoriesModel.fromMap(i));
      }
      update();
    });
  }

  void getProducts() async {
    await productRef.get().then((value) {
      for (var i in value.docs) {
        productList.add(ProductModel.fromMap(i));
      }
      update();
    });
  }
}
