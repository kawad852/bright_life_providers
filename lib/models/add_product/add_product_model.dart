// To parse this JSON data, do
//
//     final addProductModel = addProductModelFromJson(jsonString);

import 'dart:convert';

AddProductModel addProductModelFromJson(String str) => AddProductModel.fromJson(json.decode(str));

String addProductModelToJson(AddProductModel data) => json.encode(data.toJson());

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
    this.groups,
  });

  int? id;
  String? name;
  String? image;
  String? price;
  String? type;
  List<dynamic>? categorise;
  List<Group>? groups;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        type: json["type"],
        categorise: List<dynamic>.from(json["categorise"].map((x) => x)),
        groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "type": type,
        "categorise": List<dynamic>.from(categorise!.map((x) => x)),
        "groups": List<dynamic>.from(groups!.map((x) => x.toJson())),
      };
}

class Group {
  Group({
    this.id,
    this.name,
    this.type,
    this.items,
  });

  int? id;
  String? name;
  String? type;
  List<Item>? items;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.name,
    this.price,
  });

  int? id;
  String? name;
  int? price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name "],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name ": name,
        "price": price,
      };
}
