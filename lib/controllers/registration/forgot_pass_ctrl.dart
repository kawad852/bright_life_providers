import 'package:bright_life_providers/ui/surfaces/custom_overlay_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../api/registration/forgot_pass_api.dart';
import '../../binding/verification_binding.dart';
import '../../models/registration/forgot_pass_model.dart';
import '../../ui/screens/registration/verification.dart';
import '../../utils/app_constants.dart';

class ForgotPassCtrl {
  static ForgotPassModel? model;

  static Future fetchData({
    required String phoneNum,
    required BuildContext context,
  }) async {
    CustomLoader.show(context);
    model = await ForgotPassApi.data(phoneNum: phoneNum);
    if (model == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (model!.code == 200) {
      print("phone:: $phoneNum");
      Get.to(() => VerificationAccountScreen(phoneNumber: phoneNum),
          binding: VerificationBinding(phoneNum: phoneNum, route: 'new_pass'));
    } else if (model!.code == 500) {
      Fluttertoast.showToast(msg: 'Enter correct credentials');
    } else {
      Fluttertoast.showToast(msg: model!.msg!);
    }
    Loader.hide();
  }
}
