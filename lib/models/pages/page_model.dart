import 'dart:convert';

class PageModel {
  PageModel({
    required this.status,
    required this.code,
    required this.msg,
    required this.data,
  });

  bool status;
  int code;
  String msg;
  Data data;

  factory PageModel.fromRawJson(String str) => PageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PageModel.fromJson(Map<String, dynamic> json) => PageModel(
    status: json["status"],
    code: json["code"],
    msg: json["msg"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "msg": msg,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.content,
    required this.slug,
  });

  int id;
  String title;
  String content;
  String slug;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "slug": slug,
  };
}
