import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

//class is a blueprint and copy of blueprint is object
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      //To avoid bottom overflow use singlechildscrollView widget over coloumn widget/any other widget
      child: SingleChildScrollView(
        child:
            Column //a container which can consist many widgets in column wise manner
                (
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
            // use sizedbox instead of padding widget for spacing
            SizedBox(
              height: 20.0,
            ), //gives particular type of box which is blank
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter username", labelText: "Username"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter password", labelText: "Password"),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    child: Text("Login"),
                    style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    onPressed: () {
                      //Naviagtor is used to link the routes and navigate it from one page to another
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
