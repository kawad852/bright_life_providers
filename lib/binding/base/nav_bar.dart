import 'package:bright_life_providers/controllers/search/search.dart';
import 'package:get/get.dart';

class NavBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchCtrl());
  }
}
