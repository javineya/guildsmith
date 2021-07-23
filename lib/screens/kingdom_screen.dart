import 'package:flutter/material.dart';

class KingdomScreen extends StatefulWidget {
  const KingdomScreen({Key? key}) : super(key: key);
  @override
  _KingdomScreenState createState() => _KingdomScreenState();
}

class _KingdomScreenState extends State<KingdomScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Kingdom!'));
  }
}
