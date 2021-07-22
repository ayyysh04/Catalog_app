import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(
        25,
        (index) => CatalogModel
            .items[0]); //This will generate adummylist of type item[0]
    //Used to see how if there were many items will see
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0, //Removes the shadow below the appbar
        // iconTheme: IconThemeData(color: Colors.black), //This makes all color ,styling,etc related to icons in appbar eg:drawer icon
        ///We have made an seprate theme data in main.dart so that it can used everywhere in an easier manner
        title: Text(
          "Catalog App",
          // style: TextStyle(color: Colors.black),
        ),
      ),
      body:
          // Center(
          // // single widget inside wiget : child
          ////multiple widget inside wiget : children ,eg:row,coloumn,listview
          //   child: Container(
          //     child: Text("Welcome"),
          //   ),
          // ),
          Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView
            .builder //create a list and only render the list which are on screen when u scroll down the rendering of rest items starts
            (
          itemCount: dummylist.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummylist[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
