import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:lab_1/components/alert_widget.dart';
import 'package:lab_1/app/my_app.dart';

class CreateProduct extends StatefulWidget {
  @override
  State<CreateProduct> createState() => CreateProductStateful();
}

class CreateProductStateful extends State<CreateProduct> {
  String name = '';
  String description = '';
  String availability = '';
  String price = '';

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    void onSaveHandler() async {
      appState.createProduct(name, description, int.tryParse(availability) ?? 0,
          int.tryParse(price) ?? 0);

      await showDialog(
          context: context,
          builder: (BuildContext context) => AlertWidget(
              title: 'Product Created',
              content: 'Product $name created successfully!'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) => name = value,
            ),
            SizedBox(height: 20.0),
            TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                onChanged: (value) => description = value),
            SizedBox(height: 20.0),
            TextFormField(
                decoration: InputDecoration(labelText: 'Availability'),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) => availability = value),
            SizedBox(height: 20.0),
            TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) => price = value),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed:
                  onSaveHandler, // Function to call when the button is pressed
              child: Text('Save'), // Text on the button
            ),
          ],
        ),
      ),
    );
  }
}
