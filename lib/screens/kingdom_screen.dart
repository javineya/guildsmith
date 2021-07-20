import 'package:flutter/material.dart';

class KingdomScreen extends StatefulWidget {
  @override
  _KingdomScreenState createState() => _KingdomScreenState();
}

class _KingdomScreenState extends State<KingdomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GuildSmith'),
      ),
      body: SafeArea(child: Center(child: Text('Kingdom!'))),
    );
  }
}
