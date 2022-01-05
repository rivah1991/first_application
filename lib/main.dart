import 'package:flutter/material.dart';
//import 'package:flutter_map/flutter_map.dart';

import 'shop_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zjobeur',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: ShopPage(),
    );
  }
}
