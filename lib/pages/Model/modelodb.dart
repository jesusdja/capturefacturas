import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class modelodb{
  String _id;
  String _name;
  String _Description;
  String _imagen;

  modelodb(this._id,this._name,this._Description,this._imagen);

  modelodb.map(dynamic obj){
    this._name = obj['name'];
    this._Description = obj['Description'];
    this._imagen = obj['imagen'];
  }

  String get id => _id;
  String get name => _name;
  String get Description => _Description;
  String get imagen => _imagen;

  modelodb.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _name = snapshot.value['name'];
    _Description = snapshot.value['Description'];
    _imagen = snapshot.value['imagen'];
  }

}