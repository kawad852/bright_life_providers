import 'package:get/get.dart';

class AddSizeCtrl extends GetxController {
  static AddSizeCtrl get find => Get.find();

  final fields = <int>[0].obs;

  void add(int index) {
    fields.add(index);
    update();
  }
}
