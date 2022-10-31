import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../models/orders_model.dart';

class FilterController extends GetxController{
  static FilterController get find => Get.find();

  Rx<Query<OrderModel>> orderQuery = FirebaseFirestore.instance.collection('orders').orderBy('created_at', descending: false).withConverter<OrderModel>(
    fromFirestore: (snapshot, _) => OrderModel.fromJson(snapshot.data()!),
    toFirestore: (order, _) => order.toJson(),
  ).obs;

  RxString filterDate = ''.obs;
  RxString filterStatus = ''.obs;

  void changeDateFilter(bool value,String title){
    if(value){
      filterDate.value=title;
    }
    else{
      filterDate.value='';
    }
  }

  void changeStatusFilter(String title, bool value){
    if(value){
      filterStatus.value = title;
    }
    else{
      filterStatus.value = '';
    }
  }

  void filter(){
    if(filterStatus.value !=''){
      orderQuery.value = FirebaseFirestore.instance.collection('orders').where('status',isEqualTo: filterStatus.value.toLowerCase()).orderBy('created_at', descending: false).withConverter<OrderModel>(
        fromFirestore: (snapshot, _) => OrderModel.fromJson(snapshot.data()!),
        toFirestore: (order, _) => order.toJson(),
      );
    }
    else{
      orderQuery.value = FirebaseFirestore.instance.collection('orders').orderBy('created_at', descending: false).withConverter<OrderModel>(
        fromFirestore: (snapshot, _) => OrderModel.fromJson(snapshot.data()!),
        toFirestore: (order, _) => order.toJson(),
      );
    }
  }

  @override
  void onInit() {
    orderQuery.value = FirebaseFirestore.instance.collection('orders').orderBy('created_at', descending: false).withConverter<OrderModel>(
      fromFirestore: (snapshot, _) => OrderModel.fromJson(snapshot.data()!),
      toFirestore: (order, _) => order.toJson(),
    );
    super.onInit();
  }
}