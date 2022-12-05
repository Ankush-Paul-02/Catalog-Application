import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_one/core/store.dart';
import 'package:flutter_one/models/cart.dart';
import 'package:flutter_one/utils/routes.dart';
import 'package:flutter_one/widgets/themes.dart';
import 'dart:convert';
import '../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'home_widgets/Catalog_Header.dart';
import 'home_widgets/Catalog_List.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final url = "https://api.jsonbin.io/";
  //
  // get http => null;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;

    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, MyStore store, VxStatus? mutations) =>
            FloatingActionButton(
          onPressed: () => Navigator.pushNamed((context), MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
                color: Vx.red500,
                size: 21,
                count: _cart.items.length,
                textStyle: const TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
