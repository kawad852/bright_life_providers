import 'package:bright_life_providers/controllers/home/filter_ctrl.dart';
import 'package:get/get.dart';

class FilterBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(()=>FilterController());
  }

}