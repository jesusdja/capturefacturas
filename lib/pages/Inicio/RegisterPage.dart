import 'package:capturefacturas/pages/Inicio/Tabs/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capturefacturas/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => new _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return new Container(
            child: Text('HOLAAAAA'),
            margin: EdgeInsets.all(23),
            color: Colors.white,
          );


        },
      );

  }
}
