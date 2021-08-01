import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTheme? myTheme = (VxState.store as Mystore).themeMode;
    bool darkMode = false;
    final imageUrl = "https://ayyysh04.github.io/me.jpg";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(color: Colors.black26),
                    accountName: Text("Ayush yadav"),
                    accountEmail: Text("ayushiit2003@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                      radius: 200,

                      ///This will not increase due to size from useraccountdrwaerheader
                    )
                    // Image.network(imageUrl): to get image from newtork ie from online
                    //Image.asset(name) : to get image from asset/from out own file
                    )),
            Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Home",
                        textScaleFactor: 1.2,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      tileColor: Colors.redAccent,
                      leading: Icon(
                        CupertinoIcons.profile_circled,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Profile",
                        textScaleFactor: 1.2,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      tileColor: Colors.blueGrey,
                      leading: Icon(
                        CupertinoIcons.mail,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Email me",
                        textScaleFactor: 1.2,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SwitchListTile(
                      tileColor: context.backgroundColor,
                      title: "Dark Mode".text.make(),
                      value: myTheme!.isDarkMode,
                      onChanged: (value) async {
                        Scaffold.of(context).openEndDrawer();
                        await Future.delayed(Duration(
                            milliseconds:
                                300)); //Delaying the Toggling so that drawer closing animation is done
                        //await and async should be used with future to work
                        ToogleTheme(isOn: value);
                      },
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
