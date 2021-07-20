import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//class is a blueprint and copy of blueprint is object
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
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
              fontSize: 24,
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
                  height: 20.0,
                ),
                ElevatedButton(
                  child: Text("Login"),
                  style: TextButton.styleFrom(),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
