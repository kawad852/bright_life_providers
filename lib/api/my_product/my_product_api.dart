import 'dart:convert';
import 'dart:developer';

import 'package:bright_life_providers/models/my_products/my_products_model.dart';
import 'package:bright_life_providers/utils/api_url.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:http/http.dart' as http;

class MyProductsApi {
  Future<MyProductsModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.myProducts}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
        'app-locale': MySharedPreferences.language,
      };
      log("Response:: MyProductsResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("MyProductsStatusCode:: ${response.statusCode}  MyProductsBody:: ${response.body}");
      MyProductsModel model =
          MyProductsModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return model;
      } else {
        log('error ${model.msg}');
        throw "MyProducts Error";
      }
    } catch (e) {
      log("MyProducts Error $e");
      return null;
    }
  }
}
