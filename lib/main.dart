import 'package:ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';

import 'Screens/productList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Ticaret',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductList(),
      routes: Routes.routes,
    );
  }
}
