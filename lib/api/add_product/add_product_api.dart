import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bright_life_providers/models/add_product/add_product_model.dart';
import 'package:bright_life_providers/utils/api_url.dart';
import 'package:bright_life_providers/utils/shared_prefrences.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class AddProductApi {
  Future<AddProductModel?> data({
    required List groups,
    required String title,
    required String description,
    required String price,
    required String type,
    required File? image,
  }) async {
    try {
      MultipartFile? multipartFile;

      if (image != null) {
        var stream = http.ByteStream(image.openRead());
        var length = await image.length();
        multipartFile = http.MultipartFile("image", stream, length, filename: basename(image.path));
      }

      var uri = Uri.parse("${ApiUrl.mainUrl}${ApiUrl.addProduct}");

      var request = http.MultipartRequest("POST", uri);

      //multipart/form-data
      var headers = {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };

      request.headers.addAll(headers);

      if (image != null) request.files.add(multipartFile!);

      request.fields['title'] = title;
      request.fields['description'] = description;
      request.fields['price'] = price;
      request.fields['type'] = type;
      request.fields['groups'] = '$groups';

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        var jsonData = jsonDecode(responseString);
        AddProductModel updateProfileModel = AddProductModel.fromJson(jsonData);
        return updateProfileModel;
      } else {
        throw "UpdateProfile Error";
      }
    } catch (e) {
      log("UpdateProfile Error $e");
      return null;
    }
  }
}
