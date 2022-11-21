import 'package:bright_life_providers/utils/status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OrderStatusCtrl extends GetxController {
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

  void updateStats(String? value, String docId) {
    statusDDV.value = value;
    kOrderCollection.doc(docId).update({
      'status': value,
    });
    update();
  }
}
