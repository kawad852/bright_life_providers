import 'package:bright_life_providers/models/notification/notification_model.dart';
import 'package:bright_life_providers/ui/screens/notification/widget/notidication_item.dart';
import 'package:bright_life_providers/ui/widgets/base_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  final Query<NotificationModel> query = FirebaseFirestore.instance
      .collection('notification')
      .orderBy('created_at', descending: true)
      .withConverter<NotificationModel>(
        fromFirestore: (snapshot, _) =>
            NotificationModel.fromJson(snapshot.data()!),
        toFirestore: (notification, _) => notification.toJson(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: 'Notification',
      ),
      body: FirestoreListView<NotificationModel>(
        query: query,
        padding: const EdgeInsets.only(top: 18, right: 18, left: 18),
        itemBuilder: (context, snapshot) {
          final data = snapshot.data();
          // FirebaseFirestore.instance
          //     .collection('notification')
          //     .doc(data.notificationId.toString())
          //     .update({'viewed': true});
          return NotificationItem(
            orderNum: '${data.notificationId}',
            status: data.status,
            viewed: data.viewed,
            createdAt: data.createdAt.toDate(),
          );
        },
      ),
    );
  }
}
