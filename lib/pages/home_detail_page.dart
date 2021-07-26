import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item? catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(catalog!.name),
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.m0,
          children: [
            "\$${catalog!.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      // elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      ),
                    ),
                    child: "Add to cart".text.make())
                .wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false //removes safe area from bottom
        ,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog!.id
                  .toString()), //We have to give same tag to connect this
              child: Image.network(catalog!.image),
            ).h32(context),
            Expanded(
              child: VxArc //container type thing with arc
                  (
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        catalog!.name.text.xl4
                            .color(MyTheme.darkBluishColor)
                            .bold
                            .make(),

                        catalog!.desc.text
                            .textStyle(context.captionStyle!)
                            .xl
                            .make(), //captionstyle makes the text loke like a caption text
                        10.heightBox, //Same as sized box with height 10
                        "Sed ea diam sadipscing eirmod sed rebum kasd diam lorem stet. Takimata dolor labore vero voluptua amet sadipscing dolore sit, dolor dolor no diam diam, justo gubergren est no invidunt est kasd invidunt, amet invidunt lorem dolor invidunt, lorem et eos amet labore sanctus justo elitr, ipsum aliquyam dolor voluptua."
                            .text
                            .textStyle(context.captionStyle!)
                            .make()
                            .p16(),
                      ],
                    ).py64(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
