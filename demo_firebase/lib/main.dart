import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  static int catCounter = 0;

  var catDocs;

  void addCat() async {

    CollectionReference catsCollection = FirebaseFirestore.instance.collection('cats');
    catsCollection.add({
      'name':'Caramel'+catCounter.toString(),
      'birthdate': DateTime(2020,1,1),
    });
    catCounter++;
  }

  void getCats() async {
    CollectionReference catsCollection = FirebaseFirestore.instance.collection('cats');
    var results = await catsCollection.get();
    catDocs = results.docs;
    var cat = catDocs[0].data();
    print(cat);

    setState(() {});
  }

  void modifyCat(String id) async {
    CollectionReference catsCollection = FirebaseFirestore.instance.collection('cats');

    DocumentReference catDoc = catsCollection.doc(id);

    catDoc.set({
      'name':'grigri'
    });
    setState(() {});
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
            const Text('Hello!'),
            ElevatedButton(
              onPressed: addCat,
              child: Text("add cat"),
            ),
            ElevatedButton(
              onPressed: getCats,
              child: Text("Get cats"),
            ),
            Expanded(
              child: ListView(
                children: catDocs != null
                    ? catDocs.map<Widget>((c) =>
                    ElevatedButton(
                      child: Text(c['name']),
                      onPressed: (){
                        modifyCat(c.id);
                      },)).toList()
                    : [Text("loading")],
              ),
            )
          ],
        ),
      ),
    );
  }
}
