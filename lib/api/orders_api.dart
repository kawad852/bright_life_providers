import 'dart:convert';
import 'dart:developer';

import 'package:bright_life_providers/models/order_model.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:http/http.dart' as http;

class OrdersApi {
  static Future<OrdersModel?> data(int page) async {
    try {
      String url = 'https://dummyjson.com/products?limit=10&skip=${page}0&select=title,price,description,thumbnail';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: OrdersResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("OrdersStatusCode:: ${response.statusCode}  OrdersBody:: ${response.body}");
      OrdersModel model = OrdersModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return model;
      } else {
        throw "Orders Error";
      }
    } catch (e) {
      log("Orders Error $e");
      return null;
    }
  }
}
