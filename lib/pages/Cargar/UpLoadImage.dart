import 'dart:io';
import 'package:capturefacturas/main.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';


class UpLoadImage extends StatefulWidget {

  _UpLoadImageState createState() => _UpLoadImageState();
}

File image;
String filename;

class _UpLoadImageState extends State<UpLoadImage> {


  Future _getimage() async{
    var selectImage = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      image = selectImage;
      filename = basename(image.path);
    });
  }
  Future _getimageGalery() async{
    var selectImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = selectImage;
      filename = basename(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          backgroundColor: PrimaryColor,
          title: new Text('Subir nueva imagen'),
        ),
        body:GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child:ListView(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: image==null?uploadError(context):uploadArea(context),
              ),
            ],
          )
        )
    );
  }

  //Text("Seleccione una imagen",textAlign: TextAlign.center,),
  Widget uploadError(BuildContext context){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text("Seleccione una imagen",textAlign: TextAlign.center,),
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: FlatButton(
                      child: Text('Camara'),
                      onPressed: _getimage
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: _getimageGalery,
                    child: Text('Galeria'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget uploadArea(BuildContext context){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.file(image,height: MediaQuery.of(context).size.height * 0.5,),
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: FlatButton(
                      child: Text('Subir'),
                      onPressed: uploadimagen
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: deleteimagen,
                    child: Text('Borrar'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: FlatButton(
                      child: Text('Subir'),
                      onPressed: uploadimagen
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: deleteimagen,
                    child: Text('Borrar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /*Widget uploadArea2(){
    return Column(
      children: <Widget>[
        Image.file(image,width: 200,height: 100,),
        RaisedButton(
          color: Colors.blueAccent[800],
          child: Text("Subir Firebase"),
          onPressed: (){
            uploadimagen();
          },
        ),
      ],
    );
  }*/

  Future<String> uploadimagen() async{
    StorageReference ref = FirebaseStorage.instance.ref().child(filename);
    StorageUploadTask uploadTask =  ref.putFile(image);
    var downUrl = await(await uploadTask.onComplete).ref.getDownloadURL();
    //Url de la imagen que se acaba de subir
    var url = downUrl.toString();



    deleteimagen();

    return url;
  }

  Future<String> deleteimagen() async{
    setState(() {
      image = null;
      filename = "";
    });
  }

}
