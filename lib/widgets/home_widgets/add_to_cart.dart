import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

//We have make our AddToCart stateless from statefull as we r using Vxstate
class AddToCart extends StatelessWidget {
  final Item? catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  //Every time we click on the Add to cart button this widget should rebuild to show the changes in the screen
  Widget build(BuildContext context) {
    VxState.watch(context, on: [
      AddMutation,
      RemoveMutation
    ]); //This is used to listen change in AddMutation and this alos help in rebuild the widget like setstate(){}

    // final _cart = CartModel();
    final CartModel? _cart = (VxState.store as Mystore)
        .cart; //Now we dont need to make a seprate cartmodel like in above commented case ,Here we can directly take it from MyStore using Vxstate
    // final CatalogModel? _catalog = (VxState.store as Mystore).catalog;
    //If items is in the cart list then it will be true else it will be false
    bool isInCart = _cart!.items.contains(
        // widget.catalog
        catalog) ? true : false;
    //TIP: select the a word and press fn + f2 this will replace all the word in all places

    return ElevatedButton(
        onPressed: () {
          if (!isInCart) //if item is already in the cart then no operation will be be ferforemed ,this will prevent duplicate items in cart and otherwise item will be added to the cart
          {
            // isInCart = isInCart.toggle();
            // final _catalog = CatalogModel();

            // _cart.add(catalog
            //     // widget.catalog
            //     ); //widget. is used to access the passed the argument in statefull classes
            // _cart.catalog = _catalog; //This is how a setter is called
            // setState(() {});

            //Using Vxstate
            //When pressed catalog(item) will be added to mutation class
            AddMutation(catalog);
          } else {
            RemoveMutation(catalog);
            isInCart.toggle();
          }
        },
        style: ButtonStyle(
          // elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(
            // MyTheme.darkBluishColor,
            context.theme
                .buttonColor, //here context is used to access the themedata defined in Mytheme and replace with the current context(also called current theme) theme
          ),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          ),
        ),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
