import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../api/registration/forgot_pass_api.dart';
import '../../api/registration/verfication.dart';
import '../../binding/base/nav_bar.dart';
import '../../models/registration/forgot_pass_model.dart';
import '../../models/registration/verfication.dart';
import '../../ui/base/nav_bar.dart';
import '../../ui/surfaces/custom_overlay_loader.dart';
import '../../utils/app_constants.dart';
import '../../utils/shared_prefrences.dart';
import '../../ui/screens/registration/new_pass_screen.dart';

//new_pass
//home

class VerificationController extends GetxController {
  final String phoneNum, route;
  VerificationController({
    required this.phoneNum,
    required this.route,
  });

  static VerificationController get find => Get.find();

  VerificationModel? verificationModel;
  Timer? timer;
  final counter = 60.obs;

  startTimer() {
    timer = Timer.periodic(
        const Duration(
          seconds: 1,
        ), (timer) {
      if (counter.value == 0) {
        timer.cancel();
      } else {
        counter.value--;
      }
      update();
    });
    update();
  }

  Future fetchVerificationData({
    required String code,
    required BuildContext context,
  }) async {
    CustomLoader.show(context);
    log('$verificationModel');
    verificationModel =
        await VerificationApi.data(phoneNumber: phoneNum, code: code);
    if (verificationModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (verificationModel!.code == 200) {
      timer!.cancel();
      if (route == 'home') {
        Get.off(() =>  NewPassScreen(phone: phoneNum),);
        //TODO: missing api data
        MySharedPreferences.isLogIn = true;
        // MySharedPreferences.accessToken = verificationModel!.data!.token!;
        // MySharedPreferences.email = verificationModel!.data!.user!.email!;
        // MySharedPreferences.userNumber = verificationModel!.data!.user!.phone!;
        // MySharedPreferences.fName = verificationModel!.data!.user!.name!;
        // MySharedPreferences.id = verificationModel!.data!.user!.id!;
        Fluttertoast.showToast(msg: verificationModel!.msg!);
      } else {
        Get.to(() => NewPassScreen(phone: phoneNum));
      }
    } else {
      Fluttertoast.showToast(msg: verificationModel!.msg!);
    }
    Loader.hide();
  }

   ForgotPassModel? model;

   Future fetchData({
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
      Fluttertoast.showToast(msg: model!.msg!);
    } else if (model!.code == 500) {
      Fluttertoast.showToast(msg: 'Enter correct credentials');
    } else {
      Fluttertoast.showToast(msg: model!.msg!);
    }
    Loader.hide();
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    timer!.cancel();
    super.onClose();
  }
}
