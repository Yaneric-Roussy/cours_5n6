
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaneric_pages_recent/accueil.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Détails'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.only(left: 50, right: 50),
              color: Colors.deepOrangeAccent,
              alignment: Alignment.center,
              child: Text('C\'est réussi!',style: TextStyle(color: Colors.white))
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AccueilPage()));
              },
              child: Text('Revenir à l\'accueil'),
            )
          ]
        ),
      ),
    );
  }
}
