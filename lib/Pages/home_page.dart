// ignore_for_file: unused_import

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_/models/model.dart';
import 'package:test_/routes/routes.dart';
import 'package:test_/widget/drawer.dart';
import 'package:test_/widget/itemwigit.dart';
import '../Mythems/thems.dart';

import 'package:velocity_x/velocity_x.dart';

import 'Homepagewd/header.dart';
import 'Homepagewd/items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/data.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    Models.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          // ignore: deprecated_member_use
          backgroundColor: context.theme.buttonColor,
          child: const Icon(CupertinoIcons.shopping_cart),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                if (Models.items != null && Models.items.isNotEmpty)
                  Items().py16().expand()
                else
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}
