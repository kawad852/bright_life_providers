import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String status;
  final String type;
  final int orderId;
  final int supplierId;
  final int workTime;
  final Timestamp createdAt;

  const OrderModel({
    required this.orderId,
    required this.createdAt,
    required this.status,
    required this.type,
    required this.supplierId,
    required this.workTime,
  });

  static OrderModel fromJson(Map<String, dynamic> json) => OrderModel(
        orderId: json['order_id'],
        createdAt: json['created_at'],
        status: json['status'],
        type: json['type'],
        supplierId: json['supplier_id'],
        workTime: json['work_time'],
      );

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'created_at': createdAt,
        'status': status,
        'type': type,
        'supplier_id': supplierId,
        'work_time': workTime,
      };
}
