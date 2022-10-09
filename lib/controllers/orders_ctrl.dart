import 'package:bright_life_providers/api/orders_api.dart';
import 'package:bright_life_providers/models/order_model.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OrdersCtrl extends GetxController {
  static OrdersCtrl get find => Get.find();

  late PagingController<int, Orders> pagingController;

  Future<void> _fetchPage(int pageKey) async {
    try {
      final model = await OrdersApi.data(pageKey);
      final newItems = model!.products;
      if (newItems!.isEmpty) {
        pagingController.appendLastPage(newItems);
      } else {
        pagingController.appendPage(newItems, pageKey + 1);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  void onInit() {
    pagingController = PagingController(firstPageKey: 0)
      ..addPageRequestListener((pageKey) {
        _fetchPage(pageKey);
      });
    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}
