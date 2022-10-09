import 'package:bright_life_providers/api/registration/sign_in_api.dart';
import 'package:bright_life_providers/models/registration/sign_in_model.dart';
import 'package:bright_life_providers/ui/screens/home/home_screen.dart';
import 'package:bright_life_providers/ui/surfaces/custom_overlay_loader.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignInCtrl {
  static SignInModel? model;

  static Future fetchSignInData({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    CustomLoader.show(context);
    model = await SignInApi.data(email: email, password: password);
    if (model == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (model!.code == 200) {
      Get.offAll(() => const HomeScreen());
      MySharedPreferences.accessToken = model!.data!.token!;
      MySharedPreferences.email = model!.data!.user!.email!;
      MySharedPreferences.isLogIn = true;
    } else if (model!.code == 500) {
      Fluttertoast.showToast(msg: 'incorrect Email or password'.tr);
    } else {
      Fluttertoast.showToast(msg: model!.msg!);
    }
    Loader.hide();
  }
}
