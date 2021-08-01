//WE CAN USE FLUTTER BLOC (Provides a layer between widgets i.e our UI and the data with callback where Widgets states are controlled and syned with our data ) OR PROVIDER OR CUBID INSTEAD OF VXSTATE BUT THERE ARE SOME CHALLEGES AND COMPICATION .READ ABOUT THEM ON INERNET TO KNOW MORE
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

//This will store all the models which are getting manupulated / very imp in our app
//I.e all the class objects are made here and accessed to the Vxstore
class Mystore extends VxStore {
  // CatalogModel catalog=CatalogModel();//initilzer experssion
  CatalogModel? catalog;
  CartModel? cart;
  MyTheme? themeMode;
//constructor ,We can also define them initially like done in above comments too
  Mystore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart!.catalog = catalog;
    themeMode = MyTheme();
  }
}
