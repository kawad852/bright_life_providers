import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../models/registration/verfication.dart';
import '../../utils/api_url.dart';

class VerificationApi {
  static Future<VerificationModel?> data({
    required String phoneNumber,
    required String code,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.verification}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "phone": '+962$phoneNumber',
        "code": code,
      });
      log("Response:: VerificationResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("VerificationStatusCode:: ${response.statusCode}  SignInBody:: ${response.body}");
      VerificationModel model = VerificationModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return model;
      } else if (response.statusCode == 500) {
        return model;
      } else {
        throw "Verification Error";
      }
    } catch (e) {
      log("Verification Error $e");
      return null;
    }
  }
}
