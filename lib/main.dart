import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  //main fnc which is called first
  runApp(MyApp()); //runapp fnc which calls and create MyApp object
}

//fnction inside a class is called method
//function outside class is called a fubction

class MyApp extends StatelessWidget {
  //statelessWidget-widgets who state doesnt change
  //statefullWidget-widget whose state changes
  @override //this method gets override and used by al
  Widget build(BuildContext context) //build is method which return a widget
  //context specifies the location of our each widgets as there are storedd like tree/inside one in another
  {
    return MaterialApp //we have to return an app (materialapp,cupertino app,widget app) before doing anything
        (
      debugShowCheckedModeBanner:
          false, //to disable debug symbol at corner (it will be automatically removed when app goes for production)
      //home: HomePage(),//home or root route of our app
      //"/" route and home: cant be used together as they are same
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      //For creating new pages in app
      // initialRoute: "/login", //This will make our first page/route login
      routes: {
        "/": (context) =>
            HomePage(), //=> is short hand of defining fnc with return Homepage()
        // "/login": (context) =>
        //     new LoginPage(), //new is used to create new objects of a class and new and without new is same as dart compiler automatically identifies it

        //Above codes are hard coded here to use these routes for others we have make a seprate class Myroute and used them
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        //Alos u can see we didnt have to make a obejct of class route ahd directly access through the class name
        //This is because we have made the members static
      },
      //convention:
      //function : have () and starts with small letter and then captical letter can used
      //object :have () and starts with captital letters and then and then captical/small letter can used
    );
  }
}
