import 'package:bright_life_providers/ui/screens/add_product/widgets/optional_box.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/required_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProductCtrl extends GetxController {
  static CreateProductCtrl get find => Get.find();

  final isRequiredFieldsShown = false.obs;
  final requiredFields = [];
  final isOptionalFieldsShown = false.obs;

  final requiredStateKeys = <GlobalKey<RequiredBoxState>>[].obs;
  final optionalStateKeys = <GlobalKey<OptionalBoxState>>[].obs;

  void showRequiredFields(bool status) {
    isRequiredFieldsShown.value = status;
    update();
  }

  void showOptionalFields(bool status) {
    isOptionalFieldsShown.value = status;
    update();
  }

  void addRequireBox() {
    requiredStateKeys.add(GlobalKey());
    update();
  }

  void addOptionalBox() {
    optionalStateKeys.add(GlobalKey());
    update();
  }

  void removeRequiredBox(int index) {
    requiredStateKeys.removeAt(index);
    if (requiredStateKeys.isEmpty) {
      showRequiredFields(false);
    }
    update();
  }

  void removeOptionalBox(int index) {
    optionalStateKeys.removeAt(index);
    if (optionalStateKeys.isEmpty) {
      showOptionalFields(false);
    }
    update();
  }
}

final group = [
  {
    "name": null,
    "type": "required",
    "items": [
      {
        "price": null,
        "name": null,
      },
      {
        "price": null,
        "name": null,
      }
    ],
  },
];
