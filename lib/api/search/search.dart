import 'dart:convert';
import 'dart:developer';

import 'package:bright_life_providers/models/search/search_model.dart';
import 'package:bright_life_providers/utils/api_url.dart';
import 'package:http/http.dart' as http;

class SearchApi {
  static Future<SearchModel?> data({
    required String text,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.search}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "keyword": text,
      });
      log("Response:: SearchResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("SearchStatusCode:: ${response.statusCode}  SearchBody:: ${response.body}");
      SearchModel model = SearchModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return model;
      } else {
        throw "Search Error";
      }
    } catch (e) {
      log("Search Error $e");
      return null;
    }
  }
}
