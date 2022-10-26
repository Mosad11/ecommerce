import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helpers/db_helper.dart';
import 'package:ecommerce/models/cart_product_model.dart';
import 'package:ecommerce/models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

class CartViewModel extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  List<CartProductModel> cartProducts = [];
  DbHelper? dbHelper;
  int total = 0;
  String radioV = 'Standard';
  TextEditingController? streetCont;
  TextEditingController? cityCont;
  TextEditingController? stateCont;
  TextEditingController? countryCont;
  CollectionReference orderRef =
      FirebaseFirestore.instance.collection('orders');

  @override
  void onInit() {
    dbHelper = DbHelper();
    dbHelper!.createDatabase();
    getAllToCart();
    super.onInit();
    streetCont = TextEditingController();
    cityCont = TextEditingController();
    stateCont = TextEditingController();
    countryCont = TextEditingController();
  }

  Future<void> addToCart(CartProductModel model) async {
    await dbHelper!.createProduct(model);
  }

  Future<void> getAllToCart() async {
    cartProducts.clear();
    dbHelper!.allProducts().then((value) {
      for (var i in value) {
        cartProducts.add(CartProductModel.fromMap(i));
      }
      calcTotal();
      update();
    });
  }

  void calcTotal() {
    total = 0;
    for (var i in cartProducts) {
      total = total + i.price * i.count;
    }
  }

  void delete(int id) {
    dbHelper!.delete(id);
    getAllToCart();
  }

  void increase(int index) {
    cartProducts[index].count++;
    dbHelper!.update(cartProducts[index]).then((value) {
      calcTotal();
      update();
    });
  }

  void decrease(int index) {
    if (cartProducts[index].count != 1) {
      cartProducts[index].count--;
      dbHelper!.update(cartProducts[index]).then((value) {
        calcTotal();
        update();
      });
    }
  }

  Future<void> sendOrder() async {
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    OrderModel orderModel = OrderModel(
        deliveryType: radioV,
        userId: firebaseAuth.currentUser!.uid,
        address:
            '${streetCont!.text},${cityCont!.text},${stateCont!.text},${countryCont!.text}',
        isDeliverd: false,
        products: cartProducts);
    await orderRef.doc().set(orderModel.toMap()).then((value) {
      dbHelper!.clearTable();
      cartProducts.clear();
      total = 0;
      Get.back();
      Get.back();
      Get.defaultDialog(
          title: 'Congratulates',
          content: const Text('the order sent sucsessfully'),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Ok'))
          ]);
    });
    update();
  }

  @override
  void onClose() {
    cityCont!.dispose();
    stateCont!.dispose();
    streetCont!.dispose();
    countryCont!.dispose();
    super.onClose();
  }
}
