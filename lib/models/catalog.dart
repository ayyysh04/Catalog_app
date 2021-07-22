class CatalogModel {
  static final items = [
    Item(
      id: 0,
      name: "",
      desc: "",
      price: 0,
      color: "",
      image: "",
    )
  ];
}

class Item {
  final int id;

  //final means this data cannot me changed directly it will set by the contructor only and thus this class is alos an immutable class
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

//accessing constructor
// final products = [
//   Item(
//     id: 0,
//     name: "",
//     desc: "",
//     price: 0,
//     color: "",
//     image: "",
//   )
// ];
