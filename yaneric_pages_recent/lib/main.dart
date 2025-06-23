import 'package:flutter/material.dart';
import 'package:yaneric_pages_recent/accueil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AccueilPage(),
    );
  }

  Map<String, WidgetBuilder> routes() {
    return {
      '/accueil': (context) => const AccueilPage(),
    };
  }
}