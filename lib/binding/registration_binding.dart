import 'package:get/get.dart';

import '../controllers/registration/sign_in_ctrl.dart';

class RegistrationBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => SignInCtrl());
  }
}