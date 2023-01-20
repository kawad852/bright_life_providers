import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../models/registration/change_password_model.dart';
import '../../utils/api_url.dart';

class ChangePasswordApi {
  static Future<ChangePasswordModel?> data({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.changePassword}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "phone": '+962$phoneNumber',
        "password": password,
      });
      log("Response:: ChangePasswordReset\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("ChangePasswordStatusCode:: ${response.statusCode}  ChangePasswordBody:: ${response.body}");
      ChangePasswordModel model = ChangePasswordModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return model;
      } else {
        throw "ChangePassword Error";
      }
    } catch (e) {
      log("ChangePassword Error $e");
      return null;
    }
  }
}
