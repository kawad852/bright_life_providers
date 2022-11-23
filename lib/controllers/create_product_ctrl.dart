import 'package:bright_life_providers/ui/screens/add_product/widgets/required_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProductCtrl extends GetxController {
  static CreateProductCtrl get find => Get.find();

  final nameCtrl = TextEditingController().obs;
  final descriptionCtrl = TextEditingController().obs;
  final priceCtrl = TextEditingController().obs;
  final requiredCtrl = TextEditingController().obs;
  final optionalCtrl = TextEditingController().obs;

  final requiredStateKeys = <GlobalKey<RequiredBoxState>>[GlobalKey(debugLabel: '0')].obs;
  // final optionalStateKeys = <GlobalKey<OptionalBoxState>>[GlobalKey()].obs;

  final chosenType = Rxn<String>();

  final required = ['0'].obs;
  final optional = ['0'].obs;

  final req = [
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

  final types = [
    'Maintenance',
    'Home finishing',
    'Others',
  ];

  void addRequireBox(int index) {
    requiredStateKeys.add(GlobalKey(debugLabel: '$index'));
    update();
  }

  void removeRequiredBox(int index) {
    requiredStateKeys.removeAt(index);
    update();
  }

  void toggleType(String? value) {
    chosenType.value = value;
    update();
  }

  @override
  void onClose() {
    nameCtrl.value.dispose();
    descriptionCtrl.value.dispose();
    priceCtrl.value.dispose();
    requiredCtrl.value.dispose();
    optionalCtrl.value.dispose();
    super.onClose();
  }
}
