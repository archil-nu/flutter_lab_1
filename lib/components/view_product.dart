import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lab_1/app/my_app.dart';

class ViewProduct extends StatefulWidget {
  @override
  State<ViewProduct> createState() => ViewProductStateful();
}

class ViewProductStateful extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var product = appState.product;

    if (product == null) {
      return Scaffold(
        body: Center(
          child: Text('Product details are not available.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('View Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: [
            TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                initialValue: product.name,
                readOnly: true),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              initialValue: product.description,
              readOnly: true,
            ),
            SizedBox(height: 20.0),
            TextFormField(
                decoration: InputDecoration(labelText: 'Availability'),
                initialValue: product.availability.toString(),
                readOnly: true),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Price'),
              initialValue: product.price.toString(),
              readOnly: true,
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
