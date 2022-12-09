import 'package:bright_life_providers/models/items_model.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/product_bubble.dart';
import 'package:bright_life_providers/ui/screens/add_product/widgets/required_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequiredGroupsCtrl extends GetxController {
  static RequiredGroupsCtrl get find => Get.find();

  final bubbleKeys = <GlobalKey<ProductBubbleState>>[];
  final boxStateKeys = <GlobalKey<RequiredBoxState>>[];

  final myList = <ItemsModel>[
    ItemsModel(
      name: null,
      type: 'required',
      items: [Item(name: null, price: null)],
    ),
  ].obs;

  void addList() {
    myList.add(
      ItemsModel(
        name: null,
        type: 'required',
        items: [Item(name: null, price: null)],
      ),
    );
    update();
  }

  void removeList(int index) {
    myList.removeAt(index);
    update();
  }

  void addTitle(String? value, int index) {
    myList[index].name = value;
    update();
  }

  void addItem(int index) {
    myList[index].items!.add(Item(name: null, price: null));
    update();
  }

  void removeItem(int index, int number) {
    myList[index].items!.removeAt(number);
    update();
  }
}
