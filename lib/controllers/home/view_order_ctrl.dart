import 'package:bright_life_providers/api/order/view_order.dart';
import 'package:bright_life_providers/models/orders/view_order_model.dart';
import 'package:get/get.dart';

class ViewOrderCtrl extends GetxController {
  final int id;

  ViewOrderCtrl({required this.id});

  static ViewOrderCtrl get find => Get.find();

  ViewOrderModel? viewOrderModel;
  late Future<ViewOrderModel?> initialize;

  Future<ViewOrderModel?> fetchData(int id) async {
    viewOrderModel = await ViewOrderApi.data(id: id);
    return viewOrderModel;
  }

  @override
  void onInit() {
    initialize = fetchData(id);
    super.onInit();
  }
}
