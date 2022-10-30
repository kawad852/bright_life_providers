import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String status;
  final int orderId;
  final Timestamp createdAt;

  const OrderModel({
    required this.orderId,
    required this.createdAt,
    required this.status,
  });

  static OrderModel fromJson(Map<String, dynamic> json) => OrderModel(
        orderId: json['order_id'],
        createdAt: json['created_at'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'created_at': createdAt,
        'status': status,
      };
}
