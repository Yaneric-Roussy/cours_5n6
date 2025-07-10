import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        useMaterial3: true,
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
  String prenom = '';
  String nom = '';

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
          children: [
            OutlinedButton(
              child: Text('Obtenir'),
              onPressed: () async {
                DocumentSnapshot temp = await FirebaseFirestore.instance
                    .collection('etudiants')
                    .doc('2243398')
                    .get();

                Map<String, dynamic> data = temp.data() as Map<String, dynamic>;
                print(data);

                if (data != null) {
                  prenom = data['prenom'] ?? 'Prénom inconnu';
                  nom = data['nom'] ?? 'Nom inconnu';
                } else {
                  prenom = 'Aucune donnée';
                  nom = 'Aucune donnée';
                }
                setState(() {});
              },
            ),
            OutlinedButton(
              child: Text('Mettre à jour'),
              onPressed: () async {
                CollectionReference etudiantsCollection = FirebaseFirestore.instance.collection('etudiants');

                DocumentReference doc = etudiantsCollection.doc('2243398');

                doc.set({
                  'complete':true
                });
                setState(() {});
              },
            ),
            prenom != '' ?
                Text(prenom) :
                Text("Aucun prenom"),
            nom != '' ?
                Text(nom) :
                Text("Aucun nom"),
          ],
        )
      ),
    );
  }
}
