import 'package:bright_life_providers/controllers/home/view_order_ctrl.dart';
import 'package:bright_life_providers/controllers/order_status_ctrl.dart';
import 'package:get/get.dart';

class ViewOrderBinding extends Bindings {
  final int id;

  ViewOrderBinding({required this.id});

  @override
  void dependencies() {
    Get.lazyPut(() => ViewOrderCtrl(id: id));
    Get.lazyPut(() => OrderStatusCtrl());
  }
}
