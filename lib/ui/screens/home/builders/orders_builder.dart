import 'package:bright_life_providers/models/orders_model.dart';
import 'package:bright_life_providers/ui/screens/home/widgets/order_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

class OrdersBuilder extends StatelessWidget {
  const OrdersBuilder({Key? key}) : super(key: key);

  static final orderQuery = FirebaseFirestore.instance.collection('orders').orderBy('created_at', descending: false).withConverter<OrderModel>(
        fromFirestore: (snapshot, _) => OrderModel.fromJson(snapshot.data()!),
        toFirestore: (order, _) => order.toJson(),
      );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FirestoreListView<OrderModel>(
        padding: const EdgeInsets.symmetric(vertical: 20),
        query: orderQuery,
        itemBuilder: (context, snapshot) {
          final data = snapshot.data();

          return OrderBubble(
            title: '#${data.orderId}',
            status: data.status,
          );
        },
      ),
    );
  }
}
