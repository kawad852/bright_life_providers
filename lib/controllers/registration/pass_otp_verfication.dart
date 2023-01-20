import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../api/registration/verfication.dart';
import '../../models/registration/verfication.dart';
import '../../ui/screens/registration/password_resetting.dart';
import '../../ui/surfaces/custom_overlay_loader.dart';
import '../../utils/app_constants.dart';
import '../../utils/shared_prefrences.dart';

class PassOTPVerficationController {
  static VerificationModel? verficationModel;

  static Future fetchPassOTPVerficationData({
    required String phoneNumber,
    required String code,
    required BuildContext context,
  }) async {
    CustomLoader.show(context);
    log('$verficationModel');
    verficationModel = await VerificationApi.data(phoneNumber: phoneNumber, code: code);
    if (verficationModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (verficationModel!.code == 200) {
      Get.to(() => PasswordResettingScreen(
            phoneNumber: phoneNumber,
          ));
      Fluttertoast.showToast(msg: verficationModel!.msg!);
      log('MySharedPreferences.isLogIn :: ${MySharedPreferences.isLogIn}');
    }
    if (verficationModel!.code == 500) {
      Fluttertoast.showToast(msg: 'Enter correct credentials');
    } else {
      Fluttertoast.showToast(msg: verficationModel!.msg!);
    }
    Loader.hide();
  }
}
