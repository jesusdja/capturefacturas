import 'package:capturefacturas/pages/Inicio/RegisterPage.dart';
import 'package:capturefacturas/pages/Inicio/Tabs/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capturefacturas/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn =GoogleSignIn();

class Profile extends StatefulWidget {
  @override
  _Profile createState() => new _Profile();
}

class _Profile extends State<Profile> {
  bool _success;
  String _userID;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: SecondaryColor,
        body:  ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[

              ],

            );

          },
        ),
    );
  }
}