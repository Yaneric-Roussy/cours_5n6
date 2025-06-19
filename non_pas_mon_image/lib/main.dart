import 'dart:core';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:non_pas_mon_image/lib_http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Exercice non_pas_mon_image'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imageURL = "";
  List<String> imagesURL = [];
  XFile? pickedImage;
  Cookie? cookie;
  List<XFile>? imageFileList = [];
  final myController = TextEditingController();

  Future<XFile?> getImage() async {
    imageURL = 'http://10.0.2.2:8080/exos/authed/file/${myController.text}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () async {
                pickedImage = await picker.pickImage(source: ImageSource.gallery);
                if (pickedImage != null) {

                  FormData formData = FormData.fromMap({
                    "file": await MultipartFile.fromFile(pickedImage!.path, filename: pickedImage!.name)
                  });

                  await SingletonDio.signUpAndGetCookie();

                  Dio dio = SingletonDio.getDio();
                  var response = await dio.post("http://10.0.2.2:8080/exos/file", data: formData);
                  imageURL = "http://10.0.2.2:8080/exos/authed/file/${response.data}";

                  List<Cookie> cookies = await SingletonDio.cookiemanager.cookieJar.loadForRequest(Uri.parse(imageURL));
                  cookie = cookies.first;
                }
              },
              child: Text('Upload your picture first'),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                    hintText: 'Id of picture please'
                ),
              ),
            ),
            (imageURL == "" || cookie == null)
                ? const Text("Sélectionner une image")
                : Image.network(imageURL, headers:{'Cookie':"${cookie!.name}=${cookie!.value}"})
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          getImage();
        },
        tooltip: 'Gurt',
        icon: Icon(Icons.search),
        label: Text("Look up picture"),
      ),
    );
  }
}