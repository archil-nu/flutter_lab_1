import 'package:flutter/material.dart';

import 'package:lab_1/components/create_product.dart';
import 'package:lab_1/components/view_product.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => MyHomePageStateful();
}

class MyHomePageStateful extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Center(
            child: Text('Welcome to Lab 1',
                style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.headlineLarge?.fontSize,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold)));
      case 1:
        page = CreateProduct();
      case 2:
        page = ViewProduct();
      default:
        page = Placeholder();
    }

    // The container for the current page, with its background color
    var mainArea = ColoredBox(
      color: colorScheme.surfaceContainerHighest,
      child: page,
    );

    var wideLayout = Row(
      children: [
        SafeArea(
          child: NavigationRail(
            backgroundColor: colorScheme.surfaceContainer,
            extended: true,
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(
                  icon: Icon(Icons.create), label: Text('Create')),
              NavigationRailDestination(
                  icon: Icon(Icons.search), label: Text('View'))
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
          ),
        ),
        Expanded(child: mainArea),
      ],
    );

    return Scaffold(
      body: wideLayout,
    );
  }
}
