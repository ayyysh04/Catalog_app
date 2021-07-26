import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_image.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

// catalog item
class CatalogItem extends StatelessWidget {
  final Item? catalog;

  const CatalogItem({Key? key, this.catalog}) //{} make the argument optional
      : super(
            key:
                key); //we r not using assert as null saftey is there and required should be used insteadof @required
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero //used for shared animation - here in this eg u will se two animation one one clicking the item and one on clicking the back button
              (
            tag: Key(catalog!.id
                .toString()), //used for connecting (two/many/onething at two different places) (things/animation) together
            child: CatalogImage(image: catalog!.image),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog!.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog!.desc.text
                  .textStyle(context.captionStyle!)
                  .make(), //captionstyle makes the text loke like a caption text
              10.heightBox //Same as sized box with height 10
              ,
              ButtonBar //Buttonbar - bar where we can add too many buttons
                  (
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.m0,
                children: [
                  "\$${catalog!.price}".text.bold.xl.make(),
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
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16(); //vx box is similar to container
    //  .white.square(100).py16.make() //this will give padding inside the list
  }
}

//Catalog list
class Cataloglist extends StatelessWidget {
  const Cataloglist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap:
          true, // With shrinkWrap: true, you can change this behavior so that the ListView only occupies the space it needs (it will still scroll when there more items).
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
          //using navigator.push doesnt require us to define the route in main.dart/route and also we can pass argument in navigator to other page

          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                  catalog:
                      catalog), //we have to pass catalog as we have  show details of many products,therfore using Navigator.push instead pf Navigator.pushnamed
            ),
          ),
          child: CatalogItem(catalog: catalog),
        ); //this is how named argumet.optional argument is passed
      },
    );
  }
}