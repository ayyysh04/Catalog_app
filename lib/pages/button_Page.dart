import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  List<bool> values = [false, false, false, false];
  onchangedvalue({required bool val, required int switchNo}) {
    setState(() {
      values[switchNo] = values[switchNo].toggle();
      // values[switchNo] = val.toggle();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [
      Container(
        decoration: BoxDecoration(
          border: Border.all(width: 5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Room 1".text.make().centered().pOnly(top: 10),
            SwitchListTile(
              title: "switch 1".text.make(),
              value: values[0],
              onChanged: (val) {
                onchangedvalue(val: val, switchNo: 0);
              },
            ),
            SwitchListTile(
              title: "switch 2".text.make(),
              value: values[1],
              onChanged: (val) {
                onchangedvalue(val: val, switchNo: 1);
              },
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          border: Border.all(width: 5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Room 2".text.make().centered().pOnly(top: 10),
            SwitchListTile(
              title: "switch 1".text.make(),
              value: values[2],
              onChanged: (val) {
                onchangedvalue(val: val, switchNo: 2);
              },
            ),
            SwitchListTile(
              title: "switch 2".text.make(),
              value: values[3],
              onChanged: (val) {
                onchangedvalue(val: val, switchNo: 3);
              },
            ),
          ],
        ),
      ),
    ];
    addSwitch() {
      values.add(false);
      buttons.add(Container(
        decoration: BoxDecoration(
          border: Border.all(width: 15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Room new".text.make().centered().pOnly(top: 10),
            SwitchListTile(
              title: "switch 1".text.make(),
              value: values[2],
              onChanged: (val) {
                onchangedvalue(val: val, switchNo: 2);
              },
            ),
            SwitchListTile(
              title: "switch 2".text.make(),
              value: values[3],
              onChanged: (val) {
                onchangedvalue(val: val, switchNo: 3);
              },
            ),
          ],
        ),
      ));
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
              itemCount: buttons.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return buttons[index];
              },
            ),
          ).pOnly(left: 20, right: 20).expand(),
          FloatingActionButton(
            onPressed: () {
              addSwitch();
              setState(() {
                values.add(false);
                buttons.add(Text("hello"));
                print(buttons[3]);
              });
            },
            child: Icon(Icons.add),
          ).pOnly(bottom: 18)
        ],
      ),
    );
  }
}
