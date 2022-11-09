import 'package:bright_life_providers/api/order/view_order.dart';
import 'package:get/get.dart';
import 'package:bright_life_providers/models/orders/view_order_model.dart';


class ViewOrderCtrl extends GetxController{
  static ViewOrderCtrl get find => Get.find();

  ViewOrderModel? viewOrderModel;
  late Future<ViewOrderModel?> initialize;

  Future<ViewOrderModel?> fetchData(int id) async {
    viewOrderModel = await ViewOrderApi.data(id: id);
    return viewOrderModel;
  }


}