import 'package:flutter/material.dart';
import '../screens/hero_screen.dart';
import '../screens/kingdom_screen.dart';
import '../screens/shop_screen.dart';
import '../screens/smithy_screen.dart';

class Destination {
  const Destination(this.index, this.title, this.icon, this.color, this.screen);
  final int index;
  final String title;
  // TODO: Change the Icon to Image once those are created.
  final IconData icon;
  final MaterialColor color;
  final Widget screen;
}

const List<Destination> allDestinations = <Destination>[
  Destination(0, 'Shop', Icons.shopping_cart, Colors.brown, ShopScreen()),
  Destination(1, 'Kingdom', Icons.map, Colors.cyan, KingdomScreen()),
  Destination(2, 'Smithy', Icons.shield_rounded, Colors.orange, SmithyScreen()),
  Destination(3, 'Hero', Icons.car_rental, Colors.blue, HeroScreen())
];
