import 'package:get/get.dart';
import 'package:bright_life_providers/controllers/home/view_order_ctrl.dart';

class ViewOrderBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ViewOrderCtrl());
  }

}
