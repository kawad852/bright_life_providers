import 'dart:convert';
import 'dart:developer';

import 'package:bright_life_providers/models/add_product/categories_model.dart';
import 'package:bright_life_providers/utils/api_url.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:http/http.dart' as http;

class CategoriesApi {
  Future<CategoriesModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.categories}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: CategoriesResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("CategoriesStatusCode:: ${response.statusCode}  CategoriesBody:: ${response.body}");
      CategoriesModel model = CategoriesModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return model;
      } else {
        throw "Categories Error";
      }
    } catch (e) {
      log("Categories Error $e");
      return null;
    }
  }
}
