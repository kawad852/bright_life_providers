import 'package:get/get.dart';

class FilterCtrl extends GetxController {
  static FilterCtrl get find => Get.find();

  final selectedStatus = ''.obs;
  final filterStatus = ''.obs;

  void toggle(String value, bool isSelected) {
    if (isSelected) {
      selectedStatus.value = value;
    } else {
      selectedStatus.value = '';
    }
    update();
  }

  void filter() {
    filterStatus.value = selectedStatus.value;
    update(['123']);
  }
}
