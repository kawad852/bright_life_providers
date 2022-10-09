import 'dart:convert';
import 'dart:developer';

import 'package:bright_life_providers/models/registration/sign_in_model.dart';
import 'package:bright_life_providers/utils/api_url.dart';
import 'package:http/http.dart' as http;

class SignInApi {
  static Future<SignInModel?> data({
    required String email,
    required String password,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.signIn}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "email": email,
        "password": password,
      });
      log("Response:: SignInResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("SignInStatusCode:: ${response.statusCode}  SignInBody:: ${response.body}");
      SignInModel signInModel = SignInModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return signInModel;
      } else if (response.statusCode == 500) {
        return signInModel;
      } else {
        throw "SignIn Error";
      }
    } catch (e) {
      log("SignIn Error $e");
      return null;
    }
  }
}
