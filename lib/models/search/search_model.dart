import 'package:bright_life_providers/models/orders/view_order_model.dart';

class SearchModel {
  bool? status;
  int? code;
  String? msg;
  List<Data?>? data;

  SearchModel({this.status, this.code, this.msg, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v?.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? status;
  String? paymentMethod;
  String? note;

  ///TODO make sure
  String? type;

  ///TODO make sure
  String? lat;

  ///TODO make sure
  String? long;
  String? total;
  String? tax;
  String? deliveryFee;
  String? discount;
  String? percentage;
  String? number;
  String? orderValue;

  ///TODO make sure
  Address? address;
  User? user;
  Supplier? supplier;
  List<Products>? products;

  ///TODO make sure
  String? review;
  String? date;

  Data(
      {this.id,
      this.status,
      this.paymentMethod,
      this.note,
      this.type,
      this.lat,
      this.long,
      this.total,
      this.tax,
      this.deliveryFee,
      this.discount,
      this.percentage,
      this.number,
      this.orderValue,
      this.address,
      this.user,
      this.supplier,
      this.products,
      this.review,
      this.date});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    paymentMethod = json['payment_method'];
    note = json['note'];
    type = json['type'];
    lat = json['lat'];
    long = json['long'];
    total = json['total'];
    tax = json['tax'];
    deliveryFee = json['delivery_fee'];
    discount = json['discount'];
    percentage = json['percentage'];
    number = json['number'];
    orderValue = json['order_value'];
    address = json['address'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    supplier =
        json['supplier'] != null ? Supplier.fromJson(json['supplier']) : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    review = json['review'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['status'] = status;
    data['payment_method'] = paymentMethod;
    data['note'] = note;
    data['type'] = type;
    data['lat'] = lat;
    data['long'] = long;
    data['total'] = total;
    data['tax'] = tax;
    data['delivery_fee'] = deliveryFee;
    data['discount'] = discount;
    data['percentage'] = percentage;
    data['number'] = number;
    data['order_value'] = orderValue;
    data['address'] = address;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (supplier != null) {
      data['supplier'] = supplier!.toJson();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['review'] = review;
    data['date'] = date;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? lastName;
  String? phone;
  String? email;
  String? image;

  ///TODO make sure
  Address? address;

  User(
      {this.id,
      this.name,
      this.lastName,
      this.phone,
      this.email,
      this.image,
      this.address});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['image'] = image;
    data['address'] = address;
    return data;
  }
}

class Supplier {
  int? id;
  String? name;
  String? lastName;
  String? phone;
  String? email;
  String? image;

  ///TODO make sure
  Address? address;

  Supplier(
      {this.id,
      this.name,
      this.lastName,
      this.phone,
      this.email,
      this.image,
      this.address});

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['image'] = image;
    data['address'] = address;
    return data;
  }
}

class Products {
  int? id;
  int? productId;
  String? productName;
  String? productImage;
  int? quantity;
  List<Items>? items;
  String? note;
  String? area;
  String? price;

  Products(
      {this.id,
      this.productId,
      this.productName,
      this.productImage,
      this.quantity,
      this.items,
      this.note,
      this.area,
      this.price});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    quantity = json['quantity'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    note = json['note'];
    area = json['area'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_image'] = productImage;
    data['quantity'] = quantity;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['note'] = note;
    data['area'] = area;
    data['price'] = price;
    return data;
  }
}

class Items {
  int? id;
  String? groupName;
  String? itemName;
  String? price;

  Items({this.id, this.groupName, this.itemName, this.price});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupName = json['group_name'];
    itemName = json['item_name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['group_name'] = groupName;
    data['item_name'] = itemName;
    data['price'] = price;
    return data;
  }
}
