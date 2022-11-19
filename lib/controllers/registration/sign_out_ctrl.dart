import 'package:bright_life_providers/api/registration/sign_out_api.dart';
import 'package:bright_life_providers/models/registration/sign_out_model.dart';
import 'package:bright_life_providers/ui/screens/registration/sign_in_screen.dart';
import 'package:bright_life_providers/ui/surfaces/custom_overlay_loader.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignOutController {
  static SignOutModel? model;

  static _clearUserData() {
    MySharedPreferences.clearProfile();
    // FirebaseAuth.instance.signOut();
    Get.offAll(() => const SignInScreen());
  }

  static Future fetchSignOutData({
    required BuildContext context,
  }) async {
    CustomLoader.show(context);
    model = await SignOutApi.data();
    if (model == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (model!.code == 200) {
      _clearUserData();
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }

}