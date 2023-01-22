import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../models/pages/page_model.dart';
import '../../utils/api_url.dart';

class PagesApi {
  Future<PageModel?> data({
    required String slug,
}) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.pages}$slug';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      log("Response:: PageResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("PageStatusCode:: ${response.statusCode}  PageBody:: ${response.body}");
      PageModel model = PageModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return model;
      } else {
        throw "Page Error";
      }
    } catch (e) {
      log("Page Error $e");
      return null;
    }
  }
}
