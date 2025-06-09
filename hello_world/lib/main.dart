import 'dart:math';

import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // _ convention pour dire privée
  int _indexLapin = Random().nextInt(4);

  int _pafs = 0;
  int _flops = 0;

  void gererTape(int index){
    print('Bouton ' + index.toString());
    if(this._indexLapin == index){
      this._pafs++;
      _indexLapin = Random().nextInt(4);
    }else{
      this._flops++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(this._indexLapin);
    var b0 = MaterialButton(
      onPressed: () {
        gererTape(0);
      },
      child: Text(this._indexLapin == 0 ? 'Lapin' : 'Taupe'),
    );
    var b1 = MaterialButton(
      onPressed: () {
        gererTape(1);
      },
      child: Text(this._indexLapin == 1 ? 'Lapin' : 'Taupe'),
    );
    var b2 = MaterialButton(
      onPressed: () {
        gererTape(2);
      },
      child: Text(this._indexLapin == 2 ? 'Lapin' : 'Taupe'),
    );
    var b3 = MaterialButton(
      onPressed: () {
        gererTape(3);
      },
      child: Text(this._indexLapin == 3 ? 'Lapin' : 'Taupe'),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Tape le lapin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                    'Pafs: ' + this._pafs.toString(),
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30
                    )
                ),
                Text(
                  'Flops : ' + this._flops.toString(),
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30
                  ),
                )
              ],
            ),
            const Text(
                'Tape le lapin',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 40
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                b0,
                b1,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                b2,
                b3,
              ],
            )
          ],
        ),
      ),
    );
  }
}
