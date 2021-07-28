import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final Item? catalog;

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    //If items is in the cart list then it will be true else it will be false
    bool isInCart = _cart.items.contains(widget.catalog) ? true : false;
    //TIP: select the a word and press fn + f2 this will replace all the word in all places

    return ElevatedButton(
        onPressed: () {
          if (!isInCart) //if item is already in the cart then no operation will be be ferforemed ,this will prevent duplicate items in cart and otherwise item will be added to the cart
          {
            isInCart = isInCart.toggle();
            final _catalog = CatalogModel();

            _cart.add(widget
                .catalog); //widget. is used to access the passed the argument in statefull classes
            _cart.catalog = _catalog; //This is how a setter is called
            setState(() {});
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
