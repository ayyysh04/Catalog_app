import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  List<bool> switchValues = [];

  onchangedvalue({required int value}) {
    setState(() {
      switchValues[value] = switchValues[value].toggle();
    });
  }

  @override
  Widget build(BuildContext context) {
    addSwitch() {
      setState(() {
        switchValues.add(false);
      });
    }

    //--------------------
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Title(
              color: context.accentColor,
              child: "Switches".text.xl4.bold.make()),
          30.heightBox,
          Container(
            child: ListView.separated(
              itemCount: switchValues.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return SwitchListTile(
                  title: "switch 1".text.make(),
                  value: switchValues[index],
                  onChanged: (value) {
                    onchangedvalue(value: index);
                  },
                );
              },
            ),
          ).pOnly(left: 20, right: 20).expand(),
          FloatingActionButton(
            onPressed: () {
              addSwitch();
            },
            child: Icon(Icons.add),
          ).pOnly(bottom: 18)
        ],
      ),
    );
  }
}
