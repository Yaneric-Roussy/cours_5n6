import 'package:dio/dio.dart';
import 'package:exercices_http/exercice_b.dart';
import 'package:flutter/material.dart';

import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Exercice nombre double'),
    );
  }
}

Map<String, WidgetBuilder> routes() {
  return {
    '/accueil': (context) => const MyHomePage(title: 'Exercice nombre double'),
    '/exerciceb': (context) => const ExerciceBPage(title: 'Exercice Github')
  };
}


