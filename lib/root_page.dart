import 'package:flutter/material.dart';
import 'constants/destinations.dart';

class RootPage extends StatelessWidget {
  const RootPage({required this.destination});

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
        backgroundColor: destination.color,
      ),
      backgroundColor: destination.color[50],
      body: SizedBox.expand(
        child: Center(
          // TODO: Add pages to this child for game functionality
          child: Text(destination.title),
        ),
      ),
    );
  }
}
