import 'package:flutter/material.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({Key? key}) : super(key: key);

  @override
  _HeroScreenState createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GuildSmith'),
      ),
      body: SafeArea(child: Center(child: Text('Kingdom!'))),
    );
    ;
  }
}
