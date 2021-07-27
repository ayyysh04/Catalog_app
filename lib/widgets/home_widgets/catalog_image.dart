import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
            .box
            .rounded
            .p8
            .color(
              // MyTheme.creamColor
              context.canvasColor,
            )
            .make()
            .p16()
            .w40(
              context,
            ) //whalf make the width equal to the half of the screen it refrence to context
        ;
  }
}
