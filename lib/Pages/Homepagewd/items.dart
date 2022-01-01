import 'package:flutter/material.dart';
import 'package:test_/Mythems/thems.dart';
import 'package:test_/Pages/Homepagewd/Header.dart';
import 'package:test_/Pages/homepage_detail.dart';
import 'package:test_/models/cart.dart';
import 'package:test_/models/model.dart';
import 'package:velocity_x/velocity_x.dart';

import 'imagebuild.dart';

class Items extends StatelessWidget {
  get boxes => null;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Models.items.length,
      itemBuilder: (context, index) {
        final boxes = Models.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                boxes: boxes,
              ),
            ),
          ),
          child: ItemBuilder(boxes: boxes),
        );
      },
    );
  }
}

class ItemBuilder extends StatelessWidget {
  final Item boxes;

  const ItemBuilder({Key? key, required this.boxes})
      : assert(boxes != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(boxes.id.toString()),
            child: ImageBuild(
              image: boxes.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              boxes.name.text.lg.color(context.accentColor).bold.make(),
              boxes.desc.text.make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${boxes.price}".text.bold.xl.make(),
                  _AddToCart(boxes: boxes)
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item boxes;
  const _AddToCart({
    Key? key,
    required this.boxes,
  }) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 1),
          content: "Out of Stock !".text.color(context.accentColor).make(),
        ));
        isAdded = isAdded.toggle();
        final _boxes = Models();
        final _cart = CartModel();
        _cart.boxes = _boxes;
        _cart.add(widget.boxes);
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: "Buy".text.make(),
    );
  }
}
