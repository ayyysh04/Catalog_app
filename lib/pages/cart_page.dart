import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      // MyTheme.creamColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          // Placeholder().p32().expand() //place where we will be putting some data : used while making design so that this area will maeked for the future pr
          _CartList().p32().expand(),
          Divider(
            color: Colors.black,
          ) //A divider line
          ,
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final _cart = CartModel();
    final CartModel? _cart = (VxState.store as Mystore)
        .cart; //Now we dont need to make a seprate cartmodel like in above commented case ,Here we can directly take it from MyStore using Vxstate

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceAround //Same as space between but there is spcae from edges too
        ,
        children: [
          "\$${_cart!.totalprice}".text.xl5.color(context.accentColor).make(),
          // "\$9999".text.xl5.color(context.accentColor).make(),//dummy value
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              // Scaffold.of(context).openDrawer(); //This will open drwaer when clicked on button
              //saffoled.of(context) or caffoldMessenger.of(context) is used to access the elements of scaffold
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported yet".text.make(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                context.theme.buttonColor,
              ),
            ),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

//We have make our cartlist stateless from statefull as we r using Vxstate
class _CartList extends StatelessWidget {
//Approach:We can make a class cart model (where added item will be stored) like we have done for item model class and show the added item here like we done before.

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    // final _cart = CartModel();
    final CartModel? _cart = (VxState.store as Mystore)
        .cart; //Now we dont need to make a seprate cartmodel like in above commented case ,Here we can directly take it from MyStore using Vxstate

    return _cart!.items.isEmpty
        ? "Cart is Empty".text.xl3.make().centered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                onPressed: () {
                  // _cart.remove(_cart.items[index]);
                  // setState(() {});

                  RemoveMutation(_cart.items[index]);
                },
                icon: Icon(Icons.remove_circle_outline),
              ),
              title: _cart.items[index].name.text.make(),
              // "Item 1".text.make(), //dummy data
            ),
          );
  }
}
