import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: MyImagePicker(),
        ),
      )
    );
  }
}

class MyImagePicker extends StatefulWidget {
  @override
  ImagePickerState createState() => ImagePickerState();
}

class ImagePickerState extends State {


  File imageURI;
  List result;
  String path;


  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageURI = image;
      path = image.path;
    });
  }

  Future classifyImage() async {
    await Tflite.loadModel(model: "assets/model.tflite", labels: "assets/labels.txt");
    var output = await Tflite.runModelOnImage(
        path: path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5,
      );

    setState(() {
      result = output;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget> [
                backgroundHeader(),
              ],
            ),

            // mainAxisAlignment: MainAxisAlignment.center,
            SizedBox(height: 30.0,),

            imageURI == null
              ? Column(
                  children: [

                    Container(
                      child: Image.asset(
                        "assets/data.png",
                        width: 300,
                        height: 250,
                        fit: BoxFit.cover,
                      )
                    ),
            
                    SizedBox(height: 25.0,),

                    Container(
                      child: Text('No image selected'),
                    )

                  ],

              )
              : Column(
                // offset: Offset(-10, -0),
                children: [

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown.withOpacity(0.5),
                          // spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(6, 8), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.file(imageURI, width: 300, height: 250, fit: BoxFit.cover),
                  ),

                  SizedBox(height: 25),

                  Container(
                    child: Text('Klik Cek'),
                  )

                ]
              ),
              // : Image.file(imageURI, width: 300, height: 250, fit: BoxFit.cover),
            
            SizedBox(height: 25.0,),
            
            result != null
              ? Text(
                "${(result[0]["label"]).substring(1)} ${(result[0]["confidence"]*100).toInt()}%",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ) : Text(''),

            SizedBox(height: 50.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Container(
                  // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 60,
                  width: 110,
                  child: RaisedButton(
                    // icon: Icon(Feather.image),
                    onPressed: () => getImageFromGallery(),
                    child: Icon(Feather.image, size: 25, color: Colors.blue,),
                    // textColor: Colors.white,
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  ),
                ),

                Container(
                  height: 60,
                  width: 80,
                  // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: RaisedButton(
                    onPressed: () => classifyImage(),
                    child: Text(
                      'Cek',
                      style: TextStyle(fontSize: 16),
                    ),
                    textColor: Colors.white,
                    color: Colors.blue,
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  )
                ),
              ],
            ),

            // backgroundButton(),
          ],
        ),
      ),
    );
  }

}

Widget backgroundHeader() {
  return Container(
    height: 200,
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 30),
    decoration: BoxDecoration(
      color: Colors.brown,
      // border: Border(bottom: BorderSide(width: 2.0, color: Colors.blue)),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.brown.withOpacity(0.5),
          // spreadRadius: 2,
          // blurRadius: 5,
          offset: Offset(0, 5), // changes position of shadow
        ),
      ],
    ),

    child: Padding(
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pak Naga",
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "Membantu mengenali jenis penyakit buah nagamu.",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget backgroundButton() {
  return Container(

    margin: const EdgeInsets.only(top: 365),
    width: 300,
    height: 120,
    decoration: BoxDecoration(
      color: Colors.brown,
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: RaisedButton(
            onPressed: () => new ImagePickerState().getImageFromGallery(),
            child: Text('From Gallery'),
            textColor: Colors.white,
            color: Colors.blue,
            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
          )
        ),

        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: RaisedButton(
            onPressed: () => new ImagePickerState().classifyImage(),
            child: Text('Classify Image'),
            textColor: Colors.white,
            color: Colors.blue,
            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
          )
        ),
      ],
    ),
  );
}