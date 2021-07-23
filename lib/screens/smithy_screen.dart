import 'package:flutter/material.dart';

class SmithyScreen extends StatefulWidget {
  const SmithyScreen({Key? key}) : super(key: key);

  @override
  _SmithyScreenState createState() => _SmithyScreenState();
}

class _SmithyScreenState extends State<SmithyScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Smithy!'));
  }
}
