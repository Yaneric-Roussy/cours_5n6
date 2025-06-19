import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final picker = ImagePicker();

  var _imageFile;

  Future getImage() async {
    print("On ouvre le selecteur d'image");
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      print("l'image à été choisie ${pickedFile.path}");
      _imageFile = File(pickedFile.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Exercice Image background"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: _imageFile != null?
          BoxDecoration(
            image: DecorationImage(
              image: FileImage(_imageFile),
              fit: BoxFit.cover,
            ),
          )
              : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Username"
                  ),
                )
              ),
              SizedBox(height: 40),
              SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
