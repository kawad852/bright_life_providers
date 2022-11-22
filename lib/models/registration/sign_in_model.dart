// To parse this JSON data, do
//
//     final bestRatedModel = bestRatedModelFromJson(jsonString);

import 'dart:convert';

SignInModel bestRatedModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String bestRatedModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    this.status,
    this.code,
    this.msg,
    this.data,
  });

  bool? status;
  int? code;
  String? msg;
  Data? data;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        status: json["status"],
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
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
    this.token,
    this.user,
  });

  String? token;
  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user!.toJson(),
      };
}

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"] ?? '',
        phone: json["phone"] ?? '',
        email: json["email"],
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
        name: json["name"],
        city: json["city"],
        region: json["region"],
        street: json["street"],
        buildingNumber: json["building_number"],
        floorNumber: json["floor_number"],
        apartmentNumber: json["apartment_number"],
        additionalTips: json["additional_tips"],
        userId: json["user_id"],
        long: json["long"],
        lat: json["lat"],
        phoneNumber: json["phone_number"],
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
