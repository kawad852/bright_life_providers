import 'package:bright_life_providers/api/add_product/add_product_api.dart';
import 'package:bright_life_providers/models/add_product/add_product_model.dart';
import 'package:bright_life_providers/ui/surfaces/custom_overlay_loader.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProviderOrderCtrl extends GetxController {
  static ProviderOrderCtrl get find => Get.find();

  AddProductModel? model;

  final name = ''.obs;
  final price = 0.0.obs;
  final content = ''.obs;
  final type = ''.obs;
  final extras = [].obs;
  final sizes = [].obs;

  void addExtra({
    required String name,
    required double price,
  }) {
    if (price == 0.0 && name.isEmpty) {
      extras.add({});
    } else {
      var value = {
        'price': price,
        'name': name,
      };
      extras.add(value);
    }
  }

  void addSize({
    required String name,
    required double price,
  }) {
    var value = {
      'price': price,
      'name': name,
    };
    sizes.add(value);
  }

  Future<void> fetchOrder({
    required String name,
    required double price,
    required String content,
    required String type,
    required BuildContext context,
  }) async {
    var value = {
      'name': name,
      'price': price,
      'content': content,
      'type': type,
      'user_id': MySharedPreferences.id,
      'extras': extras,
      'sizes': sizes,
    };
    CustomLoader.show(context);
    model = await AddProductApi.data(product: value);
    if (model == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (model!.code == 200) {
      print("Success!!");
    } else {
      Fluttertoast.showToast(msg: model!.msg!);
    }
    Loader.hide();
  }
}
