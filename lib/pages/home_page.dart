import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';

import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/home.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Used for bottomNavigationBar
  int _selectedTab = 0;
  final _pageOptions = [
    Home(),
    CartPage(),
  ];

  void _onItemTapped(index) {
    setState(
      () {
        _selectedTab = index;
      },
    );
  }

  //Every widget has its own lifecycle
//  statfull class gives a state class
  @override
  void initState() //initizer-initilize data to build before its gets called
  {
    super.initState();
    //We cannot use this data diretly with our catalog class,so we have to first decode it
  }

//Hot reload - calls only build method to redrwa the screen
//hot restart - calls full program and to call initstate we have to do this
  // void onTap() {
  //   print("pop");
  // }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as Mystore).cart;
    // final dummylist = List.generate(25,(index) => CatalogModel.items[0]); //This will generate adummylist of type item[0]
    //Used to see how if there were many items will see
    return DefaultTabController //Creates a default tab controller for the given [child] widget.
        //TabController can be used instead of defaulttabcontroller,Refer:https://flutter.dev/docs/cookbook/design/tabs
        (
      length: 2 //No. of tabs
      ,
      child: Scaffold(
        backgroundColor: context.canvasColor,
        // context.cardColor,
        //context.cardColo same as Theme.of(context).cardColor,
        //MyTheme.darkTheme(context).cardColor //This is also same as above but here we can only use dark theme context when we switch to light theme it will not get used

        // MyTheme.creamColor,
        floatingActionButton: VxBuilder(
          builder: (context, store, VxStatus? status) {
            return VxBadge(
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              color: Vx.red500,
              size: 22.0,
              count: _cart!.items.length,
              child: FloatingActionButton(
                onPressed: () {
                  context.vxNav.push(Uri.parse(MyRoutes.cartRoute));
                  // Navigator.pushNamed(context,MyRoutes.cartRoute); //using navigator.pushname requires us to define the route in main.dart/route and demerit we cannot pass argument in navigator to other page (alternate: use navigatir.push())
                },
                child: Icon(
                  CupertinoIcons.cart,
                  color: Colors.white,
                ),
                backgroundColor: context.theme.buttonColor,
                // MyTheme.darkTheme(context).buttonColor,//same as context.theme.buttonColor (velocityx syntax)
                // MyTheme.darkBluishColor,
              ),
            );
          },
          mutations: {AddMutation, RemoveMutation},
        ),
        // appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0, //Removes the shadow below the appbar
        // iconTheme: IconThemeData(color: Colors.black), //This makes all color ,styling,etc related to icons in appbar eg:drawer icon
        ///We have made an seprate theme data in main.dart so that it can used everywhere in an easier manner
        // title: Text(
        //   "Catalog App",
        //   // style: TextStyle(color: Colors.black),
        // ),
        // ),
        // body:
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
        drawer: MyDrawer(),
        appBar: AppBar(
          //As tabbar comes below the apbar therefore bottom is used
          bottom: TabBar(
              indicatorPadding: Vx.mSymmetric(h: 30, v: 0),
              unselectedLabelColor: context.accentColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator:
                  BoxDecoration //decorated the the box of the tabindicator
                      (
                gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.orangeAccent]),
                borderRadius: BorderRadius.circular(10),
                // color: Colors.red,//color of box ,works if gradient color is not given
              ),
              tabs: [
                Tab(
                  child: "Home".text.center.bold.make(),
                ),
                Tab(child: "Cart".text.center.bold.make()),
              ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
            ),
          ],
          selectedItemColor: context.accentColor,
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
          currentIndex: _selectedTab,
        ),
        body:
            //For Appbar tab
            // TabBarView(
            //   children: [
            //     Home(),
            //     CartPage(),
            //   ],
            // ),

            //For bottom Navbar
            _pageOptions[_selectedTab],
      ),
    );
  }
}
