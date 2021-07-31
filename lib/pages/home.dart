import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  loadData() async //retries json file  from assests/files
  {
    //NOW WE ARE USING HTTP TO GET DATA JSON FROM URL THIS WILL NOT BE NEEDED AS THIS IS OUR TESTING DELAY FOR REAL WORLD PROBLEMS
    // await Future.delayed(Duration(seconds: 5));
    //used to examine real life problem as getting data from json take time and running listview with null list as it gives error
    //rootbundle : to extraxt the json files
    // final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    //---------------------
    //Getting data from http
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    //---------------------
    //This catalogJson we get is string but we want it as object
    //we have make this await beacuse rootbundle.loadstring/https.get return a future <string> means it takes time to extract the json files

    //jsondecode- return dynamic value (map,etc) and decodes the encoded data catalogjson
    final decodedData = jsonDecode(catalogJson);
    // var encodedData = jsonEncode(decodedData);//This encoded the object data again to string

    //Here the product data will be getting a list from product object
    final productData = decodedData[
        "products"]; //extract the product data from the whole json object as we dont have a products class to sync data with

    //This will convert all the items into one list which is list of items
    //This will get list from product data and map it using our constrcutor frommap and then it will get converted to list
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    //OR
    // List.from(productData).map<Item>((item) {return Item.fromMap(item);}).toList();

    //reloads the data
    if (this.mounted) //reloads data when whole widget is build i.e mounted
    {
      setState(() {});
    }
  }

  @override
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget build(BuildContext context) {
    return //Using velocityx
        SafeArea //Safearea keeps everything inside safe area i.e away from system ui (notification bar wher time,battery other thongs are there & navigation buttons in vase of on display ones)
            (
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //making appbar inside a body
          // Builder(builder: (context)
          //     //Refer:https://www.reddit.com/r/FlutterDev/comments/7yma7y/how_do_you_open_a_drawer_in_a_scaffold_using_code/
          //     //The problem is because Scaffold.of(context) uses the InheritedWidget system of looking at the build context and searching up the hierarchy of that context to find the nearest instance of Scaffold. Your build method is the context and it is creating the Scaffold, so searching 'above it' will not find a Scaffold instance.
          //     //if your trying to access the scaffold (or any InheritedWidget) in the same context, then use a Key, otherwise you'll probably already be using another context, so your good, or use a Builder/LayoutBuilder/.. OtherBuilder to get a context.
          //     //Here you'll notice now the Scaffold.of(context) is using the context of the builder which its parent is the Scaffold. So it is found when the widget hierarchy is searched.
          //     {
          //   return IconButton(
          //       onPressed: () {
          //         Scaffold.of(context).openDrawer();
          //       },
          //       icon: Icon(
          //         Icons.menu,
          //         size: 30.0,
          //       )).pOnly(
          //     top: 15,
          //     left: 15,
          //   );
          // }),
          // AppBar(),
          Container(
            padding: Vx.mOnly(
                left: 32, right: 32, bottom: 32), //same as EdgeInsets.all(32),

            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CatalogHeader(),
              // In children and many others we can use if else directly
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                Cataloglist()
                    .py16()
                    .expand() //we are using velocityx syntax ,Ps.We can wrap this with expanded() widget
              //As we areusing list in coloumn so Using an Expanded widget makes a child of a Row, Column, or Flex expand to fill the available space along the main axis
              else
                VxShimmer(
                  primaryColor: context.accentColor,
                  child: "Loading...".text.xl4.bold.make(),
                ).centered().expand()
              // CircularProgressIndicator()
              //     .centered()
              //     .expand(), //expand makes the widget to utlize full space thus center widget starts working without expand it will not get centered vertically
            ]),
          ).expand(),
        ],
      ),
    );
  }
}
