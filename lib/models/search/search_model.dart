import 'dart:convert';

class SearchModel {
  SearchModel({
    this.status,
    this.code,
    this.msg,
    this.data,
  });

  bool? status;
  int? code;
  String? msg;
  List<Datum>? data;

  SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

  String searchModelToJson() => json.encode(toJson());

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    status: json["status"],
    code: json["code"],
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "msg": msg,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.image,
    this.cover,
    this.location,
    this.description,
    this.categories,
    this.products,
  });

  int? id;
  String? name;
  String? phone;
  String? email;
  String? image;
  String? cover;
  String? location;
  String? description;
  List<Categor>? categories;
  List<Product>? products;

  Datum datumFromJson(String str) => Datum.fromJson(json.decode(str));

  String datumToJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    image: json["image"],
    cover: json["cover"],
    location: json["location"],
    description: json["description"],
    categories: List<Categor>.from(json["categories"].map((x) => Categor.fromJson(x))),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "image": image,
    "cover": cover,
    "location": location,
    "description": description,
    "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Categor {
  Categor({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  Categor categorFromJson(String str) => Categor.fromJson(json.decode(str));

  String categorToJson() => json.encode(toJson());

  factory Categor.fromJson(Map<String, dynamic> json) => Categor(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Product {
  Product({
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
  List<Categor>? categorise;
  List<Group>? groups;

  Product productFromJson(String str) => Product.fromJson(json.decode(str));

  String productToJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    price: json["price"],
    type: json["type"],
    categorise: List<Categor>.from(json["categorise"].map((x) => Categor.fromJson(x))),
    groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "price": price,
    "type": type,
    "categorise": List<dynamic>.from(categorise!.map((x) => x.toJson())),
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

  Group groupFromJson(String str) => Group.fromJson(json.decode(str));

  String groupToJson() => json.encode(toJson());

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

  Item itemFromJson(String str) => Item.fromJson(json.decode(str));

  String itemToJson() => json.encode(toJson());

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
