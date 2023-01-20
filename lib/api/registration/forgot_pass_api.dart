import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../models/registration/forgot_pass_model.dart';
import '../../utils/api_url.dart';

class ForgotPassApi {
  static Future<ForgotPassModel?> data({
    required String phoneNum,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.forgotPass}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        'phone': '+962$phoneNum',
      });
      log("Response:: ForgotPassResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("ForgotPassStatusCode:: ${response.statusCode}  ForgotPassBody:: ${response.body}");
      ForgotPassModel model = ForgotPassModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return model;
      } else {
        throw "ForgotPass Error";
      }
    } catch (e) {
      log("ForgotPass Error $e");
      return null;
    }
  }
}
