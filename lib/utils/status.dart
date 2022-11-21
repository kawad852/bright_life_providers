import 'package:cloud_firestore/cloud_firestore.dart';

const String kPending = 'pending';
const String kReceiving = 'receiving';
const String kReceived = 'received';
const String kInProgress = 'inProgress';
const String kDelivering = 'delivering';
const String kCompleted = 'completed';
const String kCanceled = 'canceled';
const String kRejected = 'rejected';

final kOrderCollection = FirebaseFirestore.instance.collection('orders');
