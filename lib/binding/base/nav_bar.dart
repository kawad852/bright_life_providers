import 'package:get/get.dart';

import '../../controllers/home/filter_ctrl.dart';
import '../../controllers/nav_bar_ctrl.dart';

class NavBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FilterCtrl());
    Get.put(NavBarCtrl());
  }
}
