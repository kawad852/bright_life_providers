import 'package:bright_life_providers/utils/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderStatusCtrl extends GetxController {
  final int orderId;

  OrderStatusCtrl({required this.orderId});

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
          title: Text('Alert'.tr),
          content: Text('Are you sure you want to change order status ?'.tr),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'.tr),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Approve'.tr),
              onPressed: () async {
                Navigator.of(context).pop();
                updateStats(value, docId);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> updateStats(String? value, String docId) async {
    statusDDV.value = value;
    await kOrderCollection.doc(docId).update({
      'status': value,
    });
    update();
  }
}
