import 'package:flutter/material.dart';
import 'package:test_/Mythems/thems.dart';
import 'package:velocity_x/velocity_x.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: deprecated_member_use
        "Shop Here".text.xl5.bold.color(context.accentColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}
