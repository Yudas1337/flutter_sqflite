class Item {
  int? _id;
  late String name;
  late int price;
  late int stock;
  late String itemCode;
  int? get id => _id;
  Item(
      {required this.name,
      required this.price,
      required this.stock,
      required this.itemCode});
  Item.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    name = map['name'];
    price = map['price'];
    stock = map['stock'];
    itemCode = map['itemCode'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'name': name,
      'price': price,
      'stock': stock,
      'itemCode': itemCode
    };
  }
}
