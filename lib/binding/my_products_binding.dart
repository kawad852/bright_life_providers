import 'package:bright_life_providers/controllers/my_product/my_product_ctrl.dart';
import 'package:get/get.dart';

class MyProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyProductsCtrl());
  }
}
