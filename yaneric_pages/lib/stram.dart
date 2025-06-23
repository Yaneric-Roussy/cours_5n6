import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaneric_pages/drawer_nav.dart';

class StramPage extends StatefulWidget {
  const StramPage({super.key, required this.title});

  final String title;

  @override
  State<StramPage> createState() => _StramPageState();
}

class _StramPageState extends State<StramPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LeTiroir(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_right_alt),
      ),
    );
  }
}
