class SearchModel {
  bool? status;
  int? code;
  String? msg;
  List<Data>? data;

  SearchModel({this.status, this.code, this.msg, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? phone;
  String? email;
  int? avgPoints;
  String? image;
  String? cover;
  String? location;
  String? type;
  String? description;
  List<Categories>? categories;
  List<Products>? products;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.avgPoints,
      this.image,
      this.cover,
      this.location,
      this.type,
      this.description,
      this.categories,
      this.products});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    avgPoints = json['avg_points'];
    image = json['image'];
    cover = json['cover'];
    location = json['location'];
    type = json['type'];
    description = json['description'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['avg_points'] = avgPoints;
    data['image'] = image;
    data['cover'] = cover;
    data['location'] = location;
    data['type'] = type;
    data['description'] = description;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;

  Categories({this.id, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? content;
  String? image;
  String? price;
  String? type;
  List<Categories>? categorise;
  List<Groups>? groups;

  Products(
      {this.id,
      this.name,
      this.content,
      this.image,
      this.price,
      this.type,
      this.categorise,
      this.groups});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    image = json['image'];
    price = json['price'];
    type = json['type'];
    if (json['categorise'] != null) {
      categorise = <Categories>[];
      json['categorise'].forEach((v) {
        categorise!.add(Categories.fromJson(v));
      });
    }
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups!.add(Groups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['content'] = content;
    data['image'] = image;
    data['price'] = price;
    data['type'] = type;
    if (categorise != null) {
      data['categorise'] = categorise!.map((v) => v.toJson()).toList();
    }
    if (groups != null) {
      data['groups'] = groups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Groups {
  int? id;
  String? name;
  String? type;
  List<Items>? items;

  Groups({this.id, this.name, this.type, this.items});

  Groups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? name;
  double? price;

  Items({this.id, this.name, this.price});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name '];
    price = json['price'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name '] = name;
    data['price'] = price;
    return data;
  }
}
