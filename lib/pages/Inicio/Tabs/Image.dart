import 'package:flutter/material.dart';
import 'package:capturefacturas/main.dart';

class Imagenes extends StatefulWidget {
  @override
  _Imagenes createState() => new _Imagenes();
}

class _Imagenes extends State<Imagenes> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: SecondaryColor,
        child: Center(
          child: Text('HOLA DESDE IMAGE'),
        ),
      ),
    );
  }
}