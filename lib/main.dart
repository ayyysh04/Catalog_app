import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  //Removes the # in roor url in web mode
  // Vx.setPathUrlStrategy(); same as below
  setPathUrlStrategy();
  //main fnc which is called first
  runApp(
    VxState(
      store: Mystore(),
      child: MyApp(),
    ),
  ); //runapp fnc which calls and create MyApp object
}

//fnction inside a class is called method
//function outside class is called a fubction

class MyApp extends StatelessWidget {
  //statelessWidget-widgets who state doesnt change
  //statefullWidget-widget whose state changes
  @override //this method gets override and used by all
  Widget build(BuildContext context) //build is method which return a widget
  //context specifies the location of our each widgets as there are storedd like tree/inside one in another
  {
    // return MaterialApp //we have to return an app (materialapp,cupertino app,widget app) before doing anything
    //------------------
    //using navigator 2.0
    return MaterialApp.router(
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        routes: {
          "/": (_, __) =>
              MaterialPage(child: HomePage()), //_ : means no argument getting
          "/login": (_, __) => MaterialPage(child: new LoginPage()),
          MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
          MyRoutes.homeDetailsRoute:
              (uri, //param//params shortform of parameter:here we will get the catalog as parameter from the .push(param:catalog)
                  //This is creting a url with link same for all products, to fix this we will pass the uri only and get the catalog (item) of the catalog item clicked by using getitembyid fnc(parsing the uri["id"]) and then we will give to the parameter catalog
                  _) {
            //here we will get the
            final catalog = (VxState.store as Mystore)
                .catalog!
                .getById(int.parse(uri.queryParameters["id"].toString()));
            return MaterialPage(
              child: HomeDetailPage(catalog: catalog),
            );
          },
          MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginPage()),
          MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage()),
        },
      ),

      debugShowCheckedModeBanner:
          false, //to disable debug symbol at corner (it will be automatically removed when app goes for production)
      //home: HomePage(),//home or root route of our app
      //"/" route and home: cant be used together as they are same
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(
          context), //Connects our whole app with light theme app data class
      darkTheme: MyTheme.darkTheme(
          context), //Connects our whole app with Dark theme app data class
      // NOTE:ALL THE ICONS,TEXT,ETC WILL USE THIS APP DATA BYDEFAULT IF NO STYLE OR DATA IS PROVIDED THERE EXTERNALLY
      //For creating new pages in app
      // initialRoute: "/login", //This will make our first page/route login
      // routes: {
      //"/" is also out intial route
      //   "/": (context) =>
      //       HomePage(), //=> is short hand of defining fnc with return Homepage()
      //   // "/login": (context) =>
      //   //     new LoginPage(), //new is used to create new objects of a class and new and without new is same as dart compiler automatically identifies it

      //   //Above codes are hard coded here to use these routes for others we have make a seprate class Myroute and used them
      //   MyRoutes.homeRoute: (context) => HomePage(),
      //   MyRoutes.loginRoute: (context) => LoginPage(),
      //   MyRoutes.cartRoute: (context) => CartPage(),
      //   //Alos u can see we didnt have to make a obejct of class route ahd directly access through the class name
      //   //This is because we have made the members static
      // },
      //convention:
      //function : have () and starts with small letter and then captical letter can used
      //object :have () and starts with captital letters and then and then captical/small letter can used
    );
  }
}
