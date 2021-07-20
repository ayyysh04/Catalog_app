import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        //single widget inside wiget : child
        //multiple widget inside wiget : children ,eg:row,coloumn,listview
        child: Container(
          child: Text("Welcome"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
