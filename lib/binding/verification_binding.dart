import 'package:get/get.dart';

import '../controllers/registration/verfication.dart';

class VerificationBinding implements Bindings {
  final String phoneNum, route;
  VerificationBinding({
    required this.phoneNum,
    required this.route,
  });

  @override
  void dependencies() {
    Get.lazyPut(() => VerificationController(phoneNum: phoneNum, route: route));
  }
}
