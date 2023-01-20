
import 'package:bright_life_providers/ui/surfaces/custom_overlay_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../api/registration/change_password_api.dart';
import '../../models/registration/change_password_model.dart';
import '../../ui/screens/registration/sign_in_screen.dart';
import '../../utils/app_constants.dart';

class ChangePasswordCtrl {
  static ChangePasswordModel? model;

  static Future fetchPasswordResetData({
    required String phoneNumber,
    required String password,
    required BuildContext context,
  }) async {
    CustomLoader.show(context);
    model = await ChangePasswordApi.data(
        phoneNumber: phoneNumber, password: password);
    if (model == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (model!.code == 200) {
      Get.off(() => const SignInScreen());
      Fluttertoast.showToast(msg: 'Password changed successfully');
    } else {
      Fluttertoast.showToast(msg: model!.msg!);
    }
    Loader.hide();
  }
}
