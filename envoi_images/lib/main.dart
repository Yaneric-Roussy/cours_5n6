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
  String imagePath = "";
  String imageURL = "";
  List<String> imagesURL = [];
  XFile? pickedImage;
  List<XFile>? imageFileList = [];

  void getImage() async {
    ImagePicker picker = ImagePicker();
    pickedImage = await picker.pickImage(source: ImageSource.gallery);
    imagePath = pickedImage!.path;
    setState(() {});
  }

  Future<List<XFile>?> getImages() async {
    ImagePicker picker = ImagePicker();
    final List<XFile>? selectedImages = await picker.pickMultiImage();
    print("Image List length : " + imageFileList!.length.toString());
    return selectedImages;
  }

  void sendImages() async {
    imageFileList = await getImages();
    if (imageFileList == null) return;

    List<Future<void>> uploadTasks = [];

    for (var image in imageFileList!) {
      uploadTasks.add(sendImage(image));
    }

    await Future.wait(uploadTasks);

    // Now all uploads are done, so we can update the UI
    setState(() {});
  }

  Future<void> sendImage(XFile image) async {
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(image.path, filename: image.name),
    });

    Dio dio = Dio();
    var response = await dio.post(
      "http://10.0.2.2:8080/exos/file",
      data: formData,
    );

    imagesURL.add('http://10.0.2.2:8080/exos/file/${response.data.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("Exercice envoi images"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: imagesURL.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 187, 210, 1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Image.network(
                      imagesURL[index],
                      height: 250,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text("Erreur de chargement de l'image");
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendImages,
        tooltip: 'Envoyer les images',
        child: const Icon(Icons.cloud_upload),
      ),
    );
  }
}
