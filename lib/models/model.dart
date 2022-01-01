import 'package:test_/Pages/Homepagewd/items.dart';

class Models {
  static final catModel = Models._internal();

  Models._internal();

  factory Models() => catModel;

  static List<Item> items = [
    Item(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
        image:
            "https://maplestore.in/wp-content/uploads/2020/10/iPhone-12-Pro.jpg")
  ];

  Item getbyid(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getypostion(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  factory Item.fromMap(Map<String, dynamic> map) {
    if (map == null) {}

    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
