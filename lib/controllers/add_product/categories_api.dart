import 'package:bright_life_providers/api/add_product/categories_api.dart';
import 'package:bright_life_providers/models/add_product/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesCtrl extends GetxController {
  static CategoriesCtrl get find => Get.find();

  CategoriesModel? model;
  late Future<CategoriesModel?> initialize;
  final categories = <DropdownMenuItem<int?>>[].obs;
  final categoriesList = <Category>[].obs;
  int? categoryId;

  Future<CategoriesModel?> fetchData() async {
    model = await CategoriesApi().data();
    if (model != null && model!.code == 200) {
      categoriesList.addAll(model!.categorys!);
      for (var element in model!.categorys!) {
        categories.add(DropdownMenuItem<int>(
          value: element.id,
          child: Text(
            element.name!,
            style: const TextStyle(color: Colors.black),
          ),
        ));
      }
    }
    return model;
  }

  @override
  void onInit() {
    initialize = fetchData();
    super.onInit();
  }
}
