// To parse this JSON data, do
//
//     final addOrderModel = addOrderModelFromJson(jsonString);

import 'dart:convert';

AddProductModel addOrderModelFromJson(String str) => AddProductModel.fromJson(json.decode(str));

String addOrderModelToJson(AddProductModel data) => json.encode(data.toJson());

class AddProductModel {
  AddProductModel({
    this.status,
    this.code,
    this.msg,
    this.data,
  });

  bool? status;
  int? code;
  String? msg;
  Data? data;

  factory AddProductModel.fromJson(Map<String, dynamic> json) => AddProductModel(
        status: json["status"],
        code: json["code"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "msg": msg,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.image,
    this.price,
    this.type,
    this.categorise,
    this.sizes,
    this.extras,
  });

  int? id;
  String? name;
  dynamic image;
  int? price;
  String? type;
  String? categorise;
  List<SizesXX>? sizes;
  List<ExtrasXX>? extras;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        type: json["type"],
        categorise: json["categorise"],
        sizes: List<SizesXX>.from(json["sizes"].map((x) => SizesXX.fromJson(x))),
        extras: List<ExtrasXX>.from(json["extras"].map((x) => ExtrasXX.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "type": type,
        "categorise": categorise,
        "sizes": List<dynamic>.from(sizes!.map((x) => x.toJson())),
        "extras": List<dynamic>.from(extras!.map((x) => x.toJson())),
      };
}

class ExtrasXX {
  ExtrasXX({
    this.id,
    this.price,
    this.name,
    this.productId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? price;
  String? name;
  int? productId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ExtrasXX.fromJson(Map<String, dynamic> json) => ExtrasXX(
        id: json["id"],
        price: json["price"],
        name: json["name"],
        productId: json["product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "name": name,
        "product_id": productId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class SizesXX {
  SizesXX({
    this.id,
    this.price,
    this.name,
    this.productId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? price;
  String? name;
  int? productId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory SizesXX.fromJson(Map<String, dynamic> json) => SizesXX(
        id: json["id"],
        price: json["price"],
        name: json["name"],
        productId: json["product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "name": name,
        "product_id": productId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
