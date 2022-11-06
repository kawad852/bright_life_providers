import 'dart:convert';
import 'dart:developer';
import 'package:bright_life_providers/models/orders/view_order_model.dart';
import 'package:bright_life_providers/utils/api_url.dart';
import 'package:http/http.dart' as http;

class ViewOrderApi {
  static Future<ViewOrderModel?> data({
    required int id,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.viewOrder}$id';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      log("Response:: ViewOrderResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("ViewOrderStatusCode:: ${response.statusCode}  ViewOrderBody:: ${response.body}");
      ViewOrderModel model =
          ViewOrderModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return model;
      } else {
        throw "View Order Error";
      }
    } catch (e) {
      log("View Order Error $e");
      return null;
    }
  }
}
