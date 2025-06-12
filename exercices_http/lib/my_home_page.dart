import 'package:dio/dio.dart';
import 'package:exercices_http/exercice_b.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int reponse = 1;

  void getHttp() async {
    try {
      var response =
      await Dio().get('https://fourn6-mobile-prof.onrender.com/exos/long/double/$reponse');
      print(response);
      this.reponse = response.data;
      setState(() {});
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Erreur reseau')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Le nombre est $reponse'),
            MaterialButton(
              textColor: Colors.red,
              child: Text('CLICkQ MOI'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExerciceBPage(title: 'Exercice Github'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getHttp();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}