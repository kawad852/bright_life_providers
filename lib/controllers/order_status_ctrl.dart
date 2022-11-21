import 'package:bright_life_providers/utils/status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderStatusCtrl extends GetxController {
  static OrderStatusCtrl get find => Get.find();

  final statusDDV = Rxn<String>();

  //TODO: translate
  List<String> status = [
    kPending,
    kReceiving,
    kReceived,
    kInProgress,
    kDelivering,
    kCompleted,
    kCanceled,
    kRejected,
  ];

  // List<String> status = [
  //   'Pending',
  //   'In Progress',
  //   'Completed',
  //   'Cancelled',
  //   'On Delivery',
  // ];

  Future<void> changeStatusDialog(
    BuildContext context, {
    required String docId,
    required String? value,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('This is a demo alert dialog.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
                updateStats(value, docId);
              },
            ),
          ],
        );
      },
    );
  }

  void updateStats(String? value, String docId) {
    statusDDV.value = value;
    kOrderCollection.doc(docId).update({
      'status': value,
    });
    update();
  }
}
