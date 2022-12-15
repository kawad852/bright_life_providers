import 'dart:convert';
import 'dart:developer';

import 'package:bright_life_providers/models/add_product/add_product_model.dart';
import 'package:bright_life_providers/utils/api_url.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:http/http.dart' as http;

class AddProductApi {
  Future<AddProductModel?> data({
    required List groups,
    required String title,
    required String description,
    required String price,
    required String type,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.addProduct}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': MySharedPreferences.accessToken,
      };
      var body = jsonEncode({
        "name": title,
        "price": price,
        "content": description,
        "user_id": MySharedPreferences.id,
        "type": type,
        "groups": groups,
      });
      log("Response:: addProductModelResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("addProductModelStatusCode:: ${response.statusCode}  addProductModelBody:: ${response.body}");
      AddProductModel addProductModel = AddProductModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return addProductModel;
      } else {
        throw "addProductModel Error";
      }
    } catch (e) {
      log("addProductModel Error $e");
      return null;
    }
  }
}
