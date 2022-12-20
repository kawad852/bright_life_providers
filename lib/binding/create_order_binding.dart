import 'package:bright_life_providers/controllers/add_product/add_product_ctrl.dart';
import 'package:bright_life_providers/controllers/add_product/categories_api.dart';
import 'package:bright_life_providers/controllers/create_product_ctrl.dart';
import 'package:bright_life_providers/controllers/required_groups_ctrl.dart';
import 'package:get/get.dart';

class CreateProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateProductCtrl());
    Get.lazyPut(() => CategoriesCtrl());
    Get.put(RequiredGroupsCtrl());
    Get.put(AddProductsCtrl());
  }
}
