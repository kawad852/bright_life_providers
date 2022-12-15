class ItemsModel {
  ItemsModel({
    this.name,
    this.type,
    this.items,
  });

  String? name;
  String? type;
  List<Item>? items;

  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type,
        'items': items,
      };
}

class Item {
  Item({
    this.price,
    this.name,
  });

  double? price;
  String? name;

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
      };
}
