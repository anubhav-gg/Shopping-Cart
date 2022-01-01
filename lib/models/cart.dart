import 'package:test_/models/model.dart';

class CartModel {
  // models field
  late Models _models;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get models
  Models get models => _models;

  set boxes(Models boxes) {}

  set models(Models newModels) {
    assert(newModels != null);
    _models = newModels;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _models.getbyid(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove Item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }

  @override
  String toString() => 'CartModel(_models: $_models)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartModel && other._models == _models;
  }

  @override
  int get hashCode => _models.hashCode;
}
