import 'package:flutter/material.dart';
import 'package:yaneric_pages/am.dart';
import 'package:yaneric_pages/gram.dart';
import 'package:yaneric_pages/stram.dart';

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
      home: const MyHomePage(title: 'Am'),
    );
  }

  Map<String, WidgetBuilder> routes() {
    return {
      '/am': (context) => const MyHomePage(title: 'am'),
      '/stram': (context) => const StramPage(title: 'stram'),
      '/gram': (context) => const GramPage(title: 'gram'),
    };
  }
}

