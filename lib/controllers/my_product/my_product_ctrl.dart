import 'package:bright_life_providers/api/add_product/categories_api.dart';
import 'package:bright_life_providers/api/my_product/my_product_api.dart';
import 'package:bright_life_providers/models/add_product/categories_model.dart';
import 'package:bright_life_providers/models/my_products/my_products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProductsCtrl extends GetxController {
  static MyProductsCtrl get find => Get.find();

  MyProductsModel? model;
  late Future<MyProductsModel?> initialize;

  Future<MyProductsModel?> fetchData() async {
    model = await MyProductsApi().data();
    return model;
  }

  @override
  void onInit() {
    initialize = fetchData();
    super.onInit();
  }
}
