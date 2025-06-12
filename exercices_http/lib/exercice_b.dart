import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ExerciceBPage extends StatefulWidget {
  const ExerciceBPage({super.key, required this.title});
  final String title;

  @override
  State<ExerciceBPage> createState() => _ExerciceBPageState();
}

class _ExerciceBPageState extends State<ExerciceBPage> {
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
            Text('Le nombre est $reponse')
          ],
        ),
      )
    );
  }
}