// To parse this JSON data, do
//
//     final forgotPassStep1Model = forgotPassStep1ModelFromJson(jsonString);

import 'dart:convert';

ForgotPassModel forgotPassStep1ModelFromJson(String str) => ForgotPassModel.fromJson(json.decode(str));

String forgotPassStep1ModelToJson(ForgotPassModel data) => json.encode(data.toJson());

class ForgotPassModel {
  ForgotPassModel({
    this.status,
    this.code,
    this.msg,
  });

  bool? status;
  int? code;
  String? msg;

  factory ForgotPassModel.fromJson(Map<String, dynamic> json) => ForgotPassModel(
        status: json["status"],
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "msg": msg,
      };
}
