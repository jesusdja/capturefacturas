import 'package:capturefacturas/pages/Inicio/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:capturefacturas/main.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => new _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: SecondaryColor,
        body:  ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return new Container(
                child: RegisterPage(),
              margin: EdgeInsets.all(23),
              color: Colors.white,
            );



          },
        ),
    );
  }
}