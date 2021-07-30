import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

//Catalog Header
class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // "Catalog App".text.make(),//velocityx syntax
        // Text("Catalog App"),same as above
        "Catalog App"
            .text
            .xl5
            .bold
            .color(context.theme.accentColor
                // MyTheme.darkBluishColor
                )
            .make(),
        // ),
        // "Trending products".text.xl2.make(),
        SizedBox(
          child: DefaultTextStyle(
            style: TextStyle(fontSize: 24, color: context.theme.accentColor),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TyperAnimatedText('Trending Products',
                    speed: Duration(milliseconds: 200)),
              ],
            ),
          ),
        ).h(30)
      ],
    );
  }
}
