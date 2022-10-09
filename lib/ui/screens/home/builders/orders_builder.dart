import 'package:bright_life_providers/controllers/orders_ctrl.dart';
import 'package:bright_life_providers/models/order_model.dart';
import 'package:bright_life_providers/ui/screens/home/widgets/order_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OrdersBuilder extends StatelessWidget {
  const OrdersBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: move to binding
    Get.lazyPut(() => OrdersCtrl());
    return Expanded(
      child: PagedListView<int, Orders>.separated(
        padding: const EdgeInsets.symmetric(vertical: 20),
        separatorBuilder: (context, index) => const SizedBox(height: 6),
        pagingController: OrdersCtrl.find.pagingController,
        builderDelegate: PagedChildBuilderDelegate<Orders>(
          itemBuilder: (context, item, index) {
            return OrderBubble(
              title: '#8615846',
              status: item.price!.toString(),
            );
          },
        ),
      ),
    );
  }
}
