import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Every widget has its own lifecycle
//  statfull class gives a state class

  @override
  void initState() //initizer-initilize data to build before its gets called
  {
    super.initState();
    loadData();
    //We cannot use this data diretly with our catalog class,so we have to first decode it
  }

  loadData() async //retries json file  from assests/files
  {
    await Future.delayed(Duration(
        seconds:
            5)); //used to examine real life problem as getting data from json take time and running listview with null list as it gives error
    //rootbundle : to extraxt the json files
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    //This catalogJson we get is string but we want it as object
    //we have make this await beacuse loadstring return a future <string> means it takes time to extract the json files

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
    setState(() {});
  }

//Hot reload - calls only build method to redrwa the screen
//hot restart - calls full program and to call initstate we have to do this
  @override
  Widget build(BuildContext context) {
    // final dummylist = List.generate(25,(index) => CatalogModel.items[0]); //This will generate adummylist of type item[0]
    //Used to see how if there were many items will see
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        // appBar: AppBar(
        //   // backgroundColor: Colors.white,
        //   // elevation: 0.0, //Removes the shadow below the appbar
        //   // iconTheme: IconThemeData(color: Colors.black), //This makes all color ,styling,etc related to icons in appbar eg:drawer icon
        //   ///We have made an seprate theme data in main.dart so that it can used everywhere in an easier manner
        //   title: Text(
        //     "Catalog App",
        //     // style: TextStyle(color: Colors.black),
        //   ),
        // ),
        body:
            //     // Center(
            //     // // single widget inside wiget : child
            //     ////multiple widget inside wiget : children ,eg:row,coloumn,listview
            //     // child: Container(
            //     //     child: Text("Welcome"),
            //     //   ),
            //     // ),
            //     Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            // ?
            //       //Using list view
            //       //  ListView
            //       //     .builder //create a list and only render the list which are on screen when u scroll down the rendering of rest items starts
            //       //     (
            //       //     itemCount: CatalogModel.items!.length,
            //       //     itemBuilder: (context, index) => ItemWidget
            //       //         //used short hand => instead of return
            //       //         (
            //       //       item: CatalogModel.items![index],
            //       //     ),
            //       //   )
            //       //using grid view
            //       GridView.builder(
            //           //grid delegrate tels to builder that how many items should be there in row or coloumn
            //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //             //crossaxix: horizontal axis
            //             //mainaxis : Vertical axis
            //             crossAxisCount: 2,
            //             mainAxisSpacing: 16,
            //             crossAxisSpacing: 16,
            //           ),

            //           itemBuilder: (context, index) {
            //             final item = CatalogModel.items![index];
            //             return Card(
            //               clipBehavior: Clip.antiAlias,
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(10)),
            //               child: GridTile(
            //                   header: Container(
            //                     child: Text(
            //                       item.name,
            //                       style: TextStyle(color: Colors.white),
            //                     ),
            //                     decoration: BoxDecoration(
            //                       color: Colors.deepPurple,
            //                     ),
            //                     padding: const EdgeInsets.all(
            //                         12), //constant :make easier for compiler as it doesnt make the padding set agian again
            //                   ),
            //                   child: Container(
            //                     child: Image.network(
            //                       item.image,
            //                     ),
            //                     // margin: EdgeInsets.all(16.0),
            //                     padding: EdgeInsets.symmetric(
            //                       vertical: 50,
            //                     ),
            //                   ),
            //                   footer: Container(
            //                     child: Text(
            //                       "\$${item.price.toString()}",
            //                       textAlign: TextAlign.center,
            //                       style: TextStyle(color: Colors.white),
            //                     ),
            //                     decoration: BoxDecoration(
            //                       color: Colors.black,
            //                     ),
            //                     padding: const EdgeInsets.all(
            //                         12), //constant :make easier for compiler as it doesnt make the padding set agian again
            //                   )),
            //             );
            //           },
            //           itemCount: CatalogModel.items!.length,
            //         )
            //       : Center(child: CircularProgressIndicator()),
            // ),
            // drawer: MyDrawer(),

            //Using velocityx
            SafeArea //Safearea keeps everything inside safe area i.e away from system ui (notification bar wher time,battery other thongs are there & navigation buttons in vase of on display ones)
                (
          child: Container(
            padding: Vx.m32, //same as EdgeInsets.all(32),

            child: Column(children: [
              CatalogHeader(),
              //In children and many others we can use if else directly
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                Cataloglist()
                    .expand() //we are using velocityx syntax ,Ps.We can wrap this with expanded() widget
              //As we areusing list in coloumn so Using an Expanded widget makes a child of a Row, Column, or Flex expand to fill the available space along the main axis
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ]),
          ),
        ));
  }
}

//Catalog Header
class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // "Catalog App".text.make(),//velocityx syntax
        // Text("Catalog App"),same as above
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

//Catalog list
class Cataloglist extends StatelessWidget {
  const Cataloglist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap:
          true, // With shrinkWrap: true, you can change this behavior so that the ListView only occupies the space it needs (it will still scroll when there more items).
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return CatalogItem(
            catalog:
                catalog); //this is how named argumet.optional argument is passed
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item? catalog;

  const CatalogItem({Key? key, this.catalog}) //{} make the argument optional
      : super(
            key:
                key); //we r not using assert as null saftey is there and required should be used insteadof @required
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog!.image),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog!.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog!.desc.text
                  .textStyle(context.captionStyle!)
                  .make(), //captionstyle makes the text loke like a caption text
              10.heightBox //Same as sized box with height 10
              ,
              ButtonBar //Buttonbar - bar where we can add too many buttons
                  (
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.m0,
                children: [
                  "\$${catalog!.price}".text.bold.xl.make(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        ),
                      ),
                      child: "Buy".text.make())
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16(); //vx box is similar to container
    //  .white.square(100).py16.make() //this will give padding inside the list
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
            .box
            .rounded
            .p8
            .color(MyTheme.creamColor)
            .make()
            .p16()
            .w40(
              context,
            ) //whalf make the width equal to the half of the screen it refrence to context
        ;
  }
}
