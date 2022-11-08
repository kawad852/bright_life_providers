import 'package:bright_life_providers/binding/view_order_binding.dart';
import 'package:bright_life_providers/controllers/filter_ctrl_refactor.dart';
import 'package:bright_life_providers/models/orders_model.dart';
import 'package:bright_life_providers/ui/screens/home/widgets/order_bubble.dart';
import 'package:bright_life_providers/ui/screens/order_details/order_details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersBuilder extends StatelessWidget {
  const OrdersBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KhaledFilterCtrl>(
      builder: (controller) {
        return Expanded(
          child: FirestoreListView<OrderModel>(
            padding: const EdgeInsets.symmetric(vertical: 20),
            query: controller.filterStatus.value.isEmpty
                ? FirebaseFirestore.instance
                    .collection('orders')
                    .orderBy('created_at', descending: false)
                    .withConverter<OrderModel>(
                      fromFirestore: (snapshot, _) =>
                          OrderModel.fromJson(snapshot.data()!),
                      toFirestore: (order, _) => order.toJson(),
                    )
                : FirebaseFirestore.instance
                    .collection('orders')
                    .where('status', isEqualTo: controller.selectedStatus.value)
                    .orderBy('created_at', descending: false)
                    .withConverter<OrderModel>(
                      fromFirestore: (snapshot, _) =>
                          OrderModel.fromJson(snapshot.data()!),
                      toFirestore: (order, _) => order.toJson(),
                    ),
            itemBuilder: (context, snapshot) {
              final data = snapshot.data();
              return InkWell(
                onTap: () {
                  Get.to(
                    () => OrderDetailsScreen(
                      id: data.orderId,
                    ),
                    binding: ViewOrderBinding(),
                  );
                },
                child: OrderBubble(
                  title: '#${data.orderId}',
                  status: data.status,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
