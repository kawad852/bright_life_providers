// To parse this JSON data, do
//
//     final bestRatedModel = bestRatedModelFromJson(jsonString);

import 'dart:convert';

OrdersModel bestRatedModelFromJson(String str) => OrdersModel.fromJson(json.decode(str));

String bestRatedModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  OrdersModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  List<Orders>? products;
  int? total;
  String? skip;
  int? limit;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        products: List<Orders>.from(json["products"].map((x) => Orders.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Orders {
  Orders({
    this.id,
    this.title,
    this.price,
    this.description,
    this.thumbnail,
  });

  int? id;
  String? title;
  int? price;
  String? description;
  String? thumbnail;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
      };
}
