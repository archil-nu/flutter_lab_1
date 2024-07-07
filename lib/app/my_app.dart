import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lab_1/model/product.dart';
import 'package:lab_1/screens/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  Product? product;

  void createProduct(
      String name, String description, int availability, int price) {
    product = Product(
        name: name,
        description: description,
        availability: availability,
        price: price);
    notifyListeners();
  }
}
