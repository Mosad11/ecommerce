import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../models/order_model.dart';

class AccountViewModel extends GetxController {
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  CollectionReference orderRef =
      FirebaseFirestore.instance.collection('orders');
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String email = '';
  String name = '';
  List<OrderModel> orderList = [];
  Future<void> getUserData() async {
    await userRef
        .where('id', isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
      name = value.docs[0]['name'];
      email = value.docs[0]['email'];
    });

    update();
  }

  Future<void> getOrders() async {
    orderList.clear();
    await orderRef
        .where('userId', isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
      for (var i in value.docs) {
        orderList.add(OrderModel.fromMap(i));
      }
      update();
    });
  }

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }
}
