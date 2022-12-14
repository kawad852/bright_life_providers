import 'package:bright_life_providers/models/items_model.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/group_bubble.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequiredGroupsCtrl extends GetxController {
  static RequiredGroupsCtrl get find => Get.find();

  final bubbleKeys = <GlobalKey<GroupBubbleState>>[];

  final groups = <ItemsModel>[].obs;

  ///...................groups
  void addGroup() {
    bubbleKeys.add(GlobalKey());
    groups.add(
      ItemsModel(
        name: null,
        type: null,
        items: [Item(name: null, price: null)],
      ),
    );
    update();
  }

  void removeGroup(int index) {
    bubbleKeys.removeAt(index);
    groups.removeAt(index);
    update();
  }

  ///...........................

  ///.............items
  void addItem(int index) {
    groups[index].items!.add(Item(name: null, price: null));
    update();
  }

  void removeItem(int index, int number) {
    groups[index].items!.removeAt(number);
    update();
  }

  ///...................

  ///.................edit
  void editTitle(String? value, int index) {
    groups[index].name = value;
    update();
  }

  void editType(String value, int index) {
    if (value == kRequired.tr) {
      value = kRequired;
    } else if (value == kOptional.tr) {
      value = kOptional;
    }
    print("value:: $value");
    groups[index].type = value;
  }

  void editItem(int index, int number, {required String name, required String price}) {
    groups[index].items![number].name = name;
    if (price.isNotEmpty) {
      groups[index].items![number].price = double.parse(price);
    }
  }

  ///..............................

  ///validation
  void validate({
    required Function validAction,
    required Function? nonValidAction,
  }) {
    bool isValid = true;
    bool boxValidation = true;
    for (var element in bubbleKeys) {
      var bubbleValidation = element.currentState!.formKey.currentState!.validate();
      for (var data in element.currentState!.requiredBoxStates) {
        var valid = data.currentState!.formKey.currentState!.validate();
        if (!valid) {
          boxValidation = false;
        }
      }
      if (!bubbleValidation || !boxValidation) {
        isValid = false;
      }
    }
    if (isValid) {
      validAction();
    } else {
      if (nonValidAction == null) return;
      nonValidAction();
    }
  }
}
