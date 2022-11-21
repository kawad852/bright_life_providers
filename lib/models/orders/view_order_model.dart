// To parse this JSON data, do
//
//     final viewOrderModel = viewOrderModelFromMap(jsonString);

import 'dart:convert';

class ViewOrderModel {
  ViewOrderModel({
    this.status,
    this.code,
    this.msg,
    this.order,
  });

  bool? status;
  int? code;
  String? msg;
  Order? order;

  ViewOrderModel viewOrderModelFromJson(String str) => ViewOrderModel.fromJson(json.decode(str));

  String viewOrderModelToJson() => json.encode(toJson());

  factory ViewOrderModel.fromJson(Map<String, dynamic> json) => ViewOrderModel(
        status: json["status"],
        code: json["code"],
        msg: json["msg"],
        order: Order.fromJson(json["Order"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "msg": msg,
        "Order": order!.toJson(),
      };
}

class Order {
  Order({
    this.id,
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
    this.date,
  });

  int? id;
  String? status;
  String? paymentMethod;
  String? note;
  String? type;
  String? lat;
  String? long;
  String? total;
  String? tax;
  String? deliveryFee;
  String? discount;
  String? percentage;
  String? number;
  String? orderValue;
  Address? address;
  Supplier? user;
  Supplier? supplier;
  List<Product>? products;
  Review? review;
  DateTime? date;

  Order orderFromJson(String str) => Order.fromJson(json.decode(str));

  String orderToJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        status: json["status"],
        paymentMethod: json["payment_method"],
        note: json["note"],
        //TODO: change later
        type: json["type"] ?? 'perhour',
        lat: json["lat"],
        long: json["long"],
        total: json["total"],
        tax: json["tax"],
        deliveryFee: json["delivery_fee"],
        discount: json["discount"],
        percentage: json["percentage"],
        number: json["number"],
        orderValue: json["order_value"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        user: json["user"] == null ? null : Supplier.fromJson(json["user"]),
        supplier: json["supplier"] == null ? null : Supplier.fromJson(json["supplier"]),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        review: json["review"] == null ? null : Review.fromJson(json["review"]),
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "payment_method": paymentMethod,
        "note": note,
        "type": type,
        "lat": lat,
        "long": long,
        "total": total,
        "tax": tax,
        "delivery_fee": deliveryFee,
        "discount": discount,
        "percentage": percentage,
        "number": number,
        "order_value": orderValue,
        "address": address == null ? null : address!.toJson(),
        "user": user == null ? null : user!.toJson(),
        "supplier": supplier == null ? null : supplier!.toJson(),
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "review": review == null ? null : review!.toJson(),
        "date": date!.toIso8601String(),
      };
}

class Address {
  Address({
    this.id,
    this.name,
    this.city,
    this.region,
    this.street,
    this.buildingNumber,
    this.floorNumber,
    this.apartmentNumber,
    this.additionalTips,
    this.userId,
    this.long,
    this.lat,
    this.phoneNumber,
  });

  int? id;
  String? name;
  String? city;
  String? region;
  String? street;
  String? buildingNumber;
  String? floorNumber;
  String? apartmentNumber;
  String? additionalTips;
  int? userId;
  String? long;
  String? lat;
  String? phoneNumber;

  Address addressFromJson(String str) => Address.fromJson(json.decode(str));

  String addressToJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        name: json["name"] ?? '',
        city: json["city"] ?? '',
        region: json["region"] ?? '',
        street: json["street"] ?? '',
        buildingNumber: json["building_number"] ?? '',
        floorNumber: json["floor_number"] ?? '',
        apartmentNumber: json["apartment_number"] ?? '',
        additionalTips: json["additional_tips"] ?? '',
        userId: json["user_id"] ?? 0,
        long: json["long"] ?? '',
        lat: json["lat"] ?? '',
        phoneNumber: json["phone_number"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "region": region,
        "street": street,
        "building_number": buildingNumber,
        "floor_number": floorNumber,
        "apartment_number": apartmentNumber,
        "additional_tips": additionalTips,
        "user_id": userId,
        "long": long,
        "lat": lat,
        "phone_number": phoneNumber,
      };
}

class Product {
  Product({
    this.id,
    this.productId,
    this.productName,
    this.productImage,
    this.quantity,
    this.items,
    this.note,
    this.area,
    this.price,
  });

  int? id;
  int? productId;
  String? productName;
  String? productImage;
  int? quantity;
  List<Item>? items;
  String? note;
  String? area;
  String? price;

  Product productFromJson(String str) => Product.fromJson(json.decode(str));

  String productToJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productId: json["product_id"],
        productName: json["product_name"],
        productImage: json["product_image"],
        quantity: json["quantity"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        note: json["note"],
        area: json["area"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product_name": productName,
        "product_image": productImage,
        "quantity": quantity,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "note": note,
        "area": area,
        "price": price,
      };
}

class Item {
  Item({
    this.id,
    this.groupName,
    this.itemName,
    this.price,
  });

  int? id;
  String? groupName;
  String? itemName;
  String? price;

  Item itemFromJson(String str) => Item.fromJson(json.decode(str));

  String itemToJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        groupName: json["group_name"],
        itemName: json["item_name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "group_name": groupName,
        "item_name": itemName,
        "price": price,
      };
}

class Review {
  Review({
    this.id,
    this.title,
    this.content,
    this.points,
    this.user,
    this.supplierId,
    this.status,
  });

  int? id;
  String? title;
  String? content;
  String? points;
  Supplier? user;
  Supplier? supplierId;
  int? status;

  Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

  String reviewToJson() => json.encode(toJson());

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        points: json["points"],
        user: json["user"] == null ? null : Supplier.fromJson(json["user"]),
        supplierId: json["supplier_id"] == null ? null : Supplier.fromJson(json["supplier_id"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "points": points,
        "user": user == null ? null : user!.toJson(),
        "supplier_id": supplierId == null ? null : supplierId!.toJson(),
        "status": status,
      };
}

class Supplier {
  Supplier({
    this.id,
    this.name,
    this.lastName,
    this.phone,
    this.email,
    this.image,
    this.address,
  });

  int? id;
  String? name;
  String? lastName;
  String? phone;
  String? email;
  String? image;
  Address? address;

  Supplier supplierFromJson(String str) => Supplier.fromJson(json.decode(str));

  String supplierToJson() => json.encode(toJson());

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        id: json["id"],
        name: json["name"] ?? '',
        lastName: json["last_name"] ?? '',
        phone: json["phone"] ?? '',
        email: json["email"] ?? '',
        image: json["image"] ?? '',
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "image": image,
        "address": address == null ? null : address!.toJson(),
      };
}
