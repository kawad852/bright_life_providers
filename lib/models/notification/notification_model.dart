import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String status;
  final bool viewed;
  final int notificationId;
  final Timestamp createdAt;

  const NotificationModel({
    required this.notificationId,
    required this.createdAt,
    required this.status,
    required this.viewed,
  });

  static NotificationModel fromJson(Map<String, dynamic> json) => NotificationModel(
    notificationId: json['notification_id'],
    createdAt: json['created_at'],
    status: json['status'],
    viewed: json['viewed'],
  );

  Map<String, dynamic> toJson() => {
    'order_id': notificationId,
    'created_at': createdAt,
    'status': status,
    'viewed': viewed,
  };
}