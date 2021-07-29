import 'dart:convert';

//Hard coded Values of item
class CatalogModel {
  //Made our class singleton so that our classes object.instance doesnt madde evrytime
  // static final catModel = CatalogModel._internal();
  // CatalogModel._internal();
  // factory CatalogModel() => catModel;

  static List<Item>? items;
  // [
  //hard code value
  // Item(
  //   id: 0,
  //   name: "iPhone 12 Pro",
  //   desc: "Apple iPhone 12th generation",
  //   price: 0,
  //   color: "#33505a",
  //   image:
  //       "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-blue-hero?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1604021661000",
  // )
  // ];

  //for cart functioning
  //get item by ID
  //REMEMBER:
  // Item.getById(int id) => ();//This is a named constructor
  // Item getById(int id) =>(); //This is a class function or in flutter u can say a 'method' which return a Item (our item model class)

  // static
  Item getById(int id) =>
      items!.firstWhere((element) => element.id == id, orElse: null);
  //firstwhere : Returns the first element that satisfies the given

  //Get item by postion
  // static
  Item getByPostion(int pos) => items![pos];
}

//Item model
class Item {
  final int id;

  //final means this data cannot me changed directly it will set by the contructor only and thus this class is also an immutable class
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

//item constrcutor
  Item(this.id, this.name, this.desc, this.price, this.color, this.image);

//We have created a custom constrcutor
//This will sync our data to out item model
//factory makes our construtor factory constructor-
//1.factory initilzes the constructor the final value on basis of some logic (NOTE:we have two constructors here)
// 2.helps in giving choice of constructor
  // factory Item.fromMap(Map<String, dynamic> map) {
  //   return Item(
  //       id: map["id"],
  //       name: map["name"],
  //       desc: map["desc"],
  //       price: map["price"],
  //       color: map["color"],
  //       image: map["image"]);
  // }

//Will encode the values again to object /json
//returns a dynamic i.e object
  // tomap() => {
  //       "id": id,
  //       "name": name,
  //       "desc": desc,
  //       "price": price,
  //       "color": color,
  //       "image": image,
  //     };

//Below constructors are made using dart data class generator extention
  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      desc ?? this.desc,
      price ?? this.price,
      color ?? this.color,
      image ?? this.image,
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

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'],
      map['name'],
      map['desc'],
      map['price'],
      map['color'],
      map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
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
