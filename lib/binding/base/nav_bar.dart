import 'package:bright_life_providers/controllers/search/search.dart';
import 'package:get/get.dart';
import 'package:bright_life_providers/controllers/home/filter_ctrl.dart';
import 'package:bright_life_providers/controllers/home/view_order_ctrl.dart';

class NavBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FilterController());
    Get.put(SearchCtrl());
  }
}
