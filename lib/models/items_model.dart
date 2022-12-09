class ItemsModel {
  ItemsModel({
    this.name,
    this.type,
    this.items,
  });

  String? name;
  String? type;
  List<Item>? items;
}

class Item {
  Item({
    this.price,
    this.name,
  });

  double? price;
  String? name;
}
