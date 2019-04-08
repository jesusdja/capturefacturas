import 'package:capturefacturas/pages/Inicio/Tabs/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capturefacturas/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn =GoogleSignIn();


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => new _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  bool _success;
  String _userID;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: SecondaryColor,
      body:  ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return new Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 200),
                child:  Column(
                  children: <Widget>[
                    Text('Iniciar Sesion',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    GoogleSignInButton(onPressed: (){
                      _signInWithGoogle();

                    },darkMode: true,)

                  ],
                ),
              ),

            ],

          );
        },
      ),
    );
  }
  void _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =  await googleUser.authentication;
    final AuthCredential credential =GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    assert(user.displayName != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
        _success = true;
        _userID = user.uid;
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder:(context) => Profile(),
        ));
      }
    });
  }
}