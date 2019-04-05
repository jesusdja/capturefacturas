import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:capturefacturas/pages/Model/modelodb.dart';

class PrincipalPage extends StatefulWidget {

  _PrincipalState createState() => _PrincipalState();
}

//https://www.youtube.com/watch?v=uzkpDEG_4R4&t=19s

final imagenesReferencia = FirebaseDatabase.instance.reference().child('imagenes');

class _PrincipalState extends State<PrincipalPage> {


  @override
  Widget build(BuildContext context) {

    List<modelodb> items;
    //min 18:55

    StreamSubscription<Event> _onSubcriptionAdd;
    StreamSubscription<Event> _onSubcriptionEdit;

    @override
    initState(){
      super.initState();
      items = new List();

      _onSubcriptionAdd = imagenesReferencia.onChildAdded.listen(_onAdd);
      _onSubcriptionEdit = imagenesReferencia.onChildAdded.listen(_onSEdit);
    }

    @override
    dispose(){
      super.dispose();
      _onSubcriptionAdd.cancel();
      _onSubcriptionEdit.cancel();
    }

    return Scaffold(
    );
  }

}