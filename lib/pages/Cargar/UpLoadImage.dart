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
        appBar: new AppBar(
          backgroundColor: PrimaryColor,
          title: new Text('Subir nueva imagen'),
        ),
        body:Column(
          children: <Widget>[
            image==null?uploadError():uploadArea(),
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
        )
    );
  }

}

Widget uploadError(){
  return Column(
    children: <Widget>[
      Text("Seleccione una imagen"),
    ],
  );
}

Widget uploadArea(){
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
}

Future<String> uploadimagen() async{
  StorageReference ref = FirebaseStorage.instance.ref().child(filename);
  StorageUploadTask uploadTask =  ref.putFile(image);

  var downUrl = await(await uploadTask.onComplete).ref.getDownloadURL();

  //Url de la imagen que se acaba de subir
  var url = downUrl.toString();


  return url;
}