//Manages all the theme of our app here
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/core/store.dart';

class MyTheme {
  ThemeMode themeMode = ThemeMode.system;
  //Getter for getting the value
  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonColor: darkBluishColor,
        accentColor: darkBluishColor //usedd for header color
        ,
        // GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context)
              .textTheme //We can use theme.of(context) to use texttheme of app in our widgets
          //Here we are using the default text theme which is color:black,etc
          ,
        ),
        // cardTheme: CardTheme(color: Colors.amber, shape: StadiumBorder())
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness
          .dark //fixes some the colors automatically (includes primary color ,etc)
      ,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      buttonColor: lightBluishColor,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6:
                  context.textTheme.headline6!.copyWith(color: Colors.white),
            ) //This is a experimental thing (refer master flutter in hust 8 hrs,timestamp:6:23:03),texttheme for app bar is overlapping with any headline6 theme (flutter deafult's) so we have copied the same headline6 text theme with a change in textcolor specifically so that that rest of our texttheme remains same
        ,
      ));

  static Color creamColor = Color(0xfff5f5f5);
  // static Color darkCreamColor = Color(0xff0b0b0b);
  //or
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}

//This class is the mutation class + we have given a perform to change our thememode
//This class is listened by our Vxstate.listener and also
// used to toogle our thememode
class ToogleTheme extends VxMutation<Mystore> {
  bool isOn;
  ToogleTheme({required this.isOn});

  @override
  perform() {
    store!.themeMode!.themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
  }
}

//We can make a store themeMode in store.dart too with a getter 