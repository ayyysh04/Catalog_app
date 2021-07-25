import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item? item; //remove ? to remove null input and to remove the assert

  const ItemWidget({Key? key, @required this.item})
      : assert(item !=
            null), //Assert is used to prevent the null value in item ,and can be removed when app is done for production
        //Now we have null saftery so there is not use of asserts now remove if u want
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //card gives a card look
    return Card(
      // color: Colors.deepPurple,
      // shape: ,
      // elevation: 0.0,
      child: ListTile(
        onTap: () {
          print("${item!.name} pressed");
        },
        //In listtile we dont have to give info like postion,size,and other things ,it gets manged on its own
        leading: Image.network(item!.image),
        title: Text(item!.name),
        subtitle: Text(item!.desc),
        trailing: Text("\$${item!.price}",
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
    );
    //Switchlisttile : for many switch buttons like in settings of our phone
  }
}
