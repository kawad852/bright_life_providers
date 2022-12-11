import 'package:bright_life_providers/models/items_model.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/required_product_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequiredGroupsCtrl extends GetxController {
  static RequiredGroupsCtrl get find => Get.find();

  final bubbleKeys = <GlobalKey<RequiredProductBubbleState>>[];

  final groups = <ItemsModel>[].obs;
  List<int> indexes = [];
  List<int> numbers = [];

  void addGroup() {
    bubbleKeys.add(GlobalKey());
    groups.add(
      ItemsModel(
        name: null,
        type: 'required',
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

  void removeNonValidGroup() {
    for (var index in indexes) {
      bubbleKeys.removeAt(index);
      groups.removeAt(index);
    }
    // groups.removeWhere((element) => element.name == null || element.items!.any((element) => element.name == null || element.price == null));
    update();
  }

  void addTitle(String? value, int index) {
    groups[index].name = value;
    update();
  }

  void addItem(int index) {
    groups[index].items!.add(Item(name: null, price: null));
    update();
  }

  void removeItem(int index, int number) {
    groups[index].items!.removeAt(number);
    update();
  }

  void validate({
    required Function validAction,
    required Function? nonValidAction,
  }) {
    indexes = [];
    bool isValid = true;
    bool boxValidation = true;
    for (var element in bubbleKeys) {
      final index = bubbleKeys.indexOf(element);
      var bubbleValidation = element.currentState!.formKey.currentState!.validate();
      for (var data in element.currentState!.requiredBoxState) {
        final number = element.currentState!.requiredBoxState.indexOf(data);
        var valid = data.currentState!.formKey.currentState!.validate();
        if (!valid) {
          boxValidation = false;
          numbers.add(number);
        }
      }
      // var boxValidation = element.currentState!.requiredBoxState.currentState!.formKey.currentState!.validate();
      if (!bubbleValidation || !boxValidation) {
        isValid = false;
        indexes.add(index);
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
