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

    Widget panel;
    switch (selectedIndex) {
      case 0:
        panel = Center(
            child: Text('Welcome to Lab 1',
                style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.headlineLarge?.fontSize,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold)));
      case 1:
        panel = CreateProduct();
      case 2:
        panel = ViewProduct();
      default:
        panel = Placeholder();
    }

    // The container for the current page, with its background color
    var workArea = ColoredBox(
      color: colorScheme.surfaceContainerHighest,
      child: panel,
    );

    var navigationPanel = SafeArea(
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
    );

    var layout = Row(
      children: [
        navigationPanel,
        Expanded(child: workArea),
      ],
    );

    return Scaffold(
      body: layout,
    );
  }
}
