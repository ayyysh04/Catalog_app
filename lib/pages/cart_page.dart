import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
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
    // VxState.watch(context, on: [RemoveMutation]); This will rebuild this whole class i.e whole widget tree which may reduce performance in big apps so we will use Vxconsumer or Vxbuilder or Vxnotifier
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceAround //Same as space between but there is spcae from edges too
        ,
        children: [
          // VxBuilder:A helper widget built on top of StreamBuilder to rebuild a small part of the screen after execution of given mutations.
          // VxNotifier:A helper widget to get callbacks after execution of mutations. Useful for handling actions connected to context such as showing SnackBar or navigating to a route etc.
          //VxConsumer:A helper widget which is nothing but a combination of VxBuilder and VxNotifier if you need both of them together. The only difference is that VxNotifier mutations are here notifications
          VxConsumer(
            builder: (context, store, _) {
              return "\$${_cart!.totalprice}"
                  .text
                  .xl5
                  .color(context.accentColor)
                  .make();
              // "\$9999".text.xl5.color(context.accentColor).make(),//dummy value
            },
            mutations: {RemoveMutation} //things which it will listen for
            ,
            notifications: {}
            //listen for any notifications
            ,
          ),
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
    //NOTE:USE VXSTATE.WATCH WISELY AS IT REBUILD THE WHOLE WIDGET TREE I.E THE WHOLE CLASS_CARTLIST
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
