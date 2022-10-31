import 'package:bright_life_providers/controllers/home/filter_ctrl.dart';
import 'package:bright_life_providers/models/orders_model.dart';
import 'package:bright_life_providers/ui/screens/home/widgets/order_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersBuilder extends GetView<FilterController> {
  const OrdersBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Expanded(
      child: FirestoreListView<OrderModel>(
        padding: const EdgeInsets.symmetric(vertical: 20),
        query: controller.orderQuery.value,
        itemBuilder: (context, snapshot) {
          final data = snapshot.data();
          print(DateTime.now());
          return OrderBubble(
            title: '#${data.orderId}',
            status: data.status,
          );
        },
      ),
    ));
  }
}
