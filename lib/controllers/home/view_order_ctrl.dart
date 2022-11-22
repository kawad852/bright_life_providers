import 'package:bright_life_providers/api/order/view_order.dart';
import 'package:bright_life_providers/controllers/order_status_ctrl.dart';
import 'package:bright_life_providers/models/orders/view_order_model.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:bright_life_providers/utils/status.dart';
import 'package:get/get.dart';

class ViewOrderCtrl extends GetxController {
  final int orderId;

  ViewOrderCtrl({required this.orderId});

  static ViewOrderCtrl get find => Get.find();

  ViewOrderModel? viewOrderModel;
  late Future<ViewOrderModel?> initialize;

  late String docId;
  late int time;

  final hideWatchStatus = [
    kDelivering,
    kCompleted,
    kCanceled,
    kRejected,
  ];

  Future<ViewOrderModel?> fetchData(int id) async {
    viewOrderModel = await ViewOrderApi.data(id: id);
    await kOrderCollection.where('order_id', isEqualTo: id).where('supplier_id', isEqualTo: MySharedPreferences.id).get().then((value) {
      docId = value.docs[0].id;
      time = value.docs[0].data()['work_time'];
      OrderStatusCtrl.find.statusDDV.value = value.docs[0].data()['status'];
    });
    return viewOrderModel;
  }

  @override
  void onInit() {
    initialize = fetchData(orderId);
    super.onInit();
  }
}
