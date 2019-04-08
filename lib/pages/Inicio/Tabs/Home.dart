import 'package:flutter/material.dart';
import 'package:capturefacturas/main.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: SecondaryColor,
        child: Center(
          child: Text('HOLA DESDE HOME'),
        ),
      ),
    );
  }
}