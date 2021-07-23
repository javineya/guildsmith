import 'package:flutter/material.dart';
import 'constants/destinations.dart';

class RootPage extends StatelessWidget {
  const RootPage({required this.destination});

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(destination.title)),
        backgroundColor: destination.color,
      ),
      backgroundColor: destination.color[100],
      body: SizedBox.expand(
        child: Center(
          child: destination.screen,
        ),
      ),
    );
  }
}
