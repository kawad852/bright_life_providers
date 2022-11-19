import 'dart:convert';

SignOutModel signOutModelFromJson(String str) =>
    SignOutModel.fromJson(json.decode(str));

String signOutModelToJson(SignOutModel data) => json.encode(data.toJson());

class SignOutModel {
  SignOutModel({
    this.status,
    this.code,
    this.msg,
  });

  bool? status;
  int? code;
  String? msg;

  factory SignOutModel.fromJson(Map<String, dynamic> json) => SignOutModel(
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
