
import 'package:capturefacturas/pages/Inicio/Prinicipal.dart';
import 'package:flutter/material.dart';


class home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        body: Stack(
            children: <Widget>[
              PrincipalPage(),
            ]
        )
    );
  }
}