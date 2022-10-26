import 'package:ecommerce/view_models/auth_view_model.dart';
import 'package:ecommerce/view_models/explore_view_model.dart';
import 'package:ecommerce/views/home/explore_view.dart';
import 'package:get/get.dart';

import '../view_models/cart_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ExploreViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}
