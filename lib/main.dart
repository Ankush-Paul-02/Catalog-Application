import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_one/core/store.dart';
import 'package:flutter_one/pages/cart_page.dart';
import 'package:flutter_one/utils/routes.dart';
import 'package:flutter_one/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/HomePage.dart';
import 'pages/LoginPage.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
