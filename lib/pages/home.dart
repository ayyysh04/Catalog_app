import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
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
