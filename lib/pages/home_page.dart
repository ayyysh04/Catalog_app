import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        //single widget inside wiget : child
        //multiple widget inside wiget : children ,eg:row,coloumn,listview
        child: Container(
          child: Text("Welcome"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
