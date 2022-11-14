import 'dart:async';

import 'package:bright_life_providers/models/search/search_model.dart';
import 'package:bright_life_providers/utils/app_constants.dart';
import 'package:bright_life_providers/api/search/search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SearchCtrl extends GetxController {
  static SearchCtrl get find => Get.find();

  final model = Rxn<SearchModel>();
  final isLoading = false.obs;
  final searchQuery = "".obs;
  Timer? _debounce;

  void toggleLoading({required bool status}) {
    isLoading.value = status;
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        searchQuery.value = query;
        fetchSearch(query: query);
      } else {
        searchQuery.value = "";
      }
    });
  }

  Future fetchSearch({required String query}) async {
    toggleLoading(status: true);
    model.value = await SearchApi.data(text: query);
    if (model.value != null) {
      if (model.value!.code == 200) {
        toggleLoading(status: false);
      } else {
        toggleLoading(status: false);
        Fluttertoast.showToast(msg: model.value!.msg!);
      }
    } else {
      toggleLoading(status: false);
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
  }
}
