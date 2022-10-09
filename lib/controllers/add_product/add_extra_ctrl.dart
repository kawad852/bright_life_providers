import 'package:get/get.dart';

class AddExtraCtrl extends GetxController {
  static AddExtraCtrl get find => Get.find();

  final fields = <int>[0].obs;

  void add(int index) {
    fields.add(index);
    update();
  }
}
