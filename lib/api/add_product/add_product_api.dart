import 'dart:convert';
import 'dart:developer';

import 'package:bright_life_providers/models/add_product/add_product_model.dart';
import 'package:bright_life_providers/utils/api_url.dart';
import 'package:http/http.dart' as http;

class AddProductApi {
  static Future<AddProductModel?> data({
    required Map<String, dynamic> product,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.addProduct}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode(product);
      log("Response:: AddProductResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("AddProductStatusCode:: ${response.statusCode}  AddProductBody:: ${response.body}");
      AddProductModel model = AddProductModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return model;
      } else {
        throw "AddProduct Error";
      }
    } catch (e) {
      log("AddProduct Error $e");
      return null;
    }
  }
}
