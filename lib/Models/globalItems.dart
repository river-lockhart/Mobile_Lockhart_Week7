import 'item.dart';

class GlobalItems {
  static final GlobalItems _items = GlobalItems._instance();

  factory GlobalItems() {
    return _items;
  }

  GlobalItems._instance();

  List<Item> items = [
    Item(1, "Cup", "This is a cup"),
    Item(2, "Plate", "This is a plate"),
    Item(3, "Bowl", "This is a bowl"),
    Item(4, "Spoon", "This is a spoon"),
    Item(5, "Fork", "This is a fork"),
    Item(6, "Knife", "This is a knife"),
    Item(7, "Spatula", "This is a spatula"),
    Item(8, "Tongs", "This is a tongs"),
    Item(9, "Ladle", "This is a ladle"),
    Item(10, "Whisk", "This is a whisk"),
  ];
}
