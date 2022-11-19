import 'dart:convert';
import 'dart:developer';

import 'package:bright_life_providers/models/registration/sign_out_model.dart';
import 'package:bright_life_providers/utils/api_url.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:http/http.dart' as http;

class SignOutApi {
  static Future data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.signOut}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: SignOutResponse\nUrl:: $url\nheaders:: $headers\n");
      http.Response response = await http.get(uri, headers: headers);
      log("SignOutStatusCode:: ${response.statusCode}  SignOutBody:: ${response.body}");
      SignOutModel signOutModel = SignOutModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return signOutModel;
      } else {
        throw "SignOut Error";
      }
    } catch (e) {
      log("SignOut Error $e");
      return null;
    }
  }
}
