import 'package:flutter/material.dart';

class Destination {
  const Destination(this.index, this.title, this.icon, this.color);
  final int index;
  final String title;
  // TODO: Change the Icon to Image once those are created.
  final IconData icon;
  final MaterialColor color;
  // TODO: Add final for different screens
}

const List<Destination> allDestinations = <Destination>[
  // TODO: Add screens
  Destination(0, 'Shop', Icons.shopping_cart, Colors.brown),
  Destination(1, 'Kingdom', Icons.map, Colors.cyan),
  Destination(2, 'Smithy', Icons.shield_rounded, Colors.orange),
  Destination(3, 'Hero', Icons.car_rental, Colors.blue)
];
