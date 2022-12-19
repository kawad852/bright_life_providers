import 'dart:io';

import 'package:bright_life_providers/api/add_product/add_product_api.dart';
import 'package:bright_life_providers/models/add_product/add_product_model.dart';
import 'package:bright_life_providers/ui/surfaces/custom_overlay_loader.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddProductsCtrl extends GetxController {
  static AddProductsCtrl get find => Get.find();

  AddProductModel? addProductModel;

  Future fetchAddProductsData({
    required List groups,
    required String title,
    required String description,
    required String price,
    required String type,
    required File? image,
    required BuildContext context,
  }) async {
    CustomLoader.show(context);
    addProductModel = await AddProductApi().data(
      title: title,
      price: price,
      type: type,
      description: description,
      groups: groups,
    );
    await AddProductApi().uploadImage(image, addProductModel!.data!.id!);
    if (addProductModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (addProductModel!.code == 200) {
      Get.back();
      Fluttertoast.showToast(msg: 'Product added successfully'.tr);
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
