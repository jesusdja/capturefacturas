import 'package:capturefacturas/pages/Inicio/Tabs/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capturefacturas/main.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => new _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: SecondaryColor,
      body:  ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return new Container(
            child: LoginPage(),
            margin: EdgeInsets.all(23),
            color: Colors.white,
          );


        },
      ),
    );
  }
}

class LoginPage extends StatefulWidget{

  final String title;

  LoginPage({Key key, this.title}) : super(key : key);

  _LoginPageState createState() => _LoginPageState();

  }

class _LoginPageState extends State<LoginPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registrarse'),

        ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.email),

              ),
            ),
            SizedBox(
              height: 15.0,
            ),

            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.vpn_key),

              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            FlatButton(
              child: Text('Login'),
              color: PrimaryColor,
              textColor: Colors.white,
              onPressed: (){
                /*FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,).then((FirebaseUser user){
                      Navigator.of(context).pushReplacement(CupertinoPageRoute(
                        builder: (context) => Profile(),
                      ));
                });*/

              },
            ),
          ],
        ),
      ),
    );
  }
}

