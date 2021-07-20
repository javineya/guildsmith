import 'package:flutter/material.dart';

class Destination {
  const Destination(this.index, this.title, this.icon, this.color);
  final int index;
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination(0, 'Shop', Icons.shopping_cart, Colors.brown),
  Destination(1, 'Kingdom', Icons.map, Colors.cyan),
  Destination(2, 'Smithy', Icons.shield_rounded, Colors.orange),
  Destination(3, 'Hero', Icons.car_rental, Colors.blue)
];
