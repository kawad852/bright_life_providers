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
    "Order": order?.toJson(),
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
    this.user,
    this.supplier,
    this.products,
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
  Supplier? user;
  Supplier? supplier;
  List<Product>? products;

  Order orderFromJson(String str) => Order.fromJson(json.decode(str));

  String orderToJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    status: json["status"],
    paymentMethod: json["payment_method"],
    note: json["note"],
    type: json["type"],
    lat: json["lat"],
    long: json["long"],
    total: json["total"],
    tax: json["tax"],
    deliveryFee: json["delivery_fee"],
    discount: json["discount"],
    percentage: json["percentage"],
    number: json["number"],
    orderValue: json["order_value"],
    user: Supplier.fromJson(json["user"]),
    supplier: Supplier.fromJson(json["supplier"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
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
    "user": user?.toJson(),
    "supplier": supplier?.toJson(),
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.id,
    this.productId,
    this.productName,
    this.productImage,
    this.quantity,
    this.sizeId,
    this.size,
    this.extras,
    this.note,
    this.price,
  });

  int? id;
  int? productId;
  String? productName;
  String? productImage;
  int? quantity;
  int? sizeId;
  String? size;
  List<Extra>? extras;
  String? note;
  String? price;

  Product productFromJson(String str) => Product.fromJson(json.decode(str));

  String productToJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    productId: json["product_id"],
    productName: json["product_name"],
    productImage: json["product_image"],
    quantity: json["quantity"],
    sizeId: json["size_id"],
    size: json["size"],
    extras: List<Extra>.from(json["extras"].map((x) => Extra.fromJson(x))),
    note: json["note"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "product_name": productName,
    "product_image": productImage,
    "quantity": quantity,
    "size_id": sizeId,
    "size": size,
    "extras": List<dynamic>.from(extras!.map((x) => x.toJson())),
    "note": note,
    "price": price,
  };
}

class Extra {
  Extra({
    this.id,
    this.name,
    this.price,
  });

  int? id;
  String? name;
  String? price;

  Extra extraFromJson(String str) => Extra.fromJson(json.decode(str));

  String extraToJson() => json.encode(toJson());

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
    id: json["id"],
    name: json["name"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
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
    name: json["name"],
    lastName: json["last_name"],
    phone: json["phone"],
    email: json["email"],
    image: json["image"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "last_name": lastName,
    "phone": phone,
    "email": email,
    "image": image,
    "address": address ?? address?.toJson(),
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

  Address addressFromJson(String str) => Address.fromJson(json.decode(str));

  String addressToJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    name: json["name"],
    city: json["city"],
    region: json["region"],
    street: json["street"],
    buildingNumber: json["building_number"],
    floorNumber: json["floor_number"],
    apartmentNumber: json["apartment_number"],
    additionalTips: json["additional_tips"],
    userId: json["user_id"],
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
  };
}
