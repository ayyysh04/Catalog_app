import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  //Made our class singleton so that our classes object.instance doesnt madde evrytime
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  //catalog field
  CatalogModel? _catalog;

//collections of IDs -> store IDs of each item

  final List<int> _itemIds = [];

//Getter : eg: CatalogModel? get catalog => _catalog;
//this getter gets the value of _catalog and save it to Catalogmode catalog

//NOTE:Getter/Setter and a class method/function is alomst same and dosent affect the performance of the program.
//As catalog is private member so it can onlt be accessed using a getter
//Getter for getting the catalog value
//Get Catalog
  CatalogModel? get catalog => _catalog;

  //Above code will show warning as getter and setter are used if there is some logic behind if not use methods/function to do the same task
  // CatalogModel getcatalog() {
  //   return _catalog;
  // }

// Set Catalog : setter
  set catalog(CatalogModel? newCatalog) {
    // assert(newCatalog != null);//This is not required because newCatalog cant be null due to null saftey but catalogmodel ? newcatlaog can be null
    _catalog = newCatalog;
  }

  //Get items  in the cart :Will map the items

  List<Item> get items => _itemIds.map((id) => _catalog!.getById(id)).toList();
  //Get total price

  num get totalprice => items.fold(
      0,
      (total, current) =>
          total +
          current
              .price); //fold is like a sum function (for exact functions hover over the fold keyword) which takes a initial value and sum up all the items using a logic

  //or
//  num get totalprice{
//    num sum=0;
//    for (var i = 0; i <items.length; i++) {
//      sum=sum+items[i].price;
//    }
//    return sum;
//  }

//For fucntioning of add to cart and remove buttons
//Add Item
  void add(Item? item) {
    _itemIds.add(item!
        .id); //.add() will add this item id to our itemids list when clicked on the button
  }

//Remove item

  void remove(Item? item) {
    _itemIds.remove(item!
        .id); //.remove() will remove this item id from our itemids list when clicked on the button
  }
}
