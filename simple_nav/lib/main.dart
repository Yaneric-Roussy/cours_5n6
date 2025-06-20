import 'package:flutter/material.dart';
import 'package:simple_nav/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      routes: routes(),
    );
  }

  Map<String, WidgetBuilder> routes() {
    return {
      'homePage': (context) => const MyHomePage(),
    };
  }
}
