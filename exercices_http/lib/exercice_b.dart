import 'package:dio/dio.dart';
import 'package:exercices_http/transfert_http.dart';
import 'package:flutter/material.dart';

import 'lib_http.dart';

class ExerciceBPage extends StatefulWidget {
  const ExerciceBPage({super.key, required this.title});
  final String title;

  @override
  State<ExerciceBPage> createState() => _ExerciceBPageState();
}



class _ExerciceBPageState extends State<ExerciceBPage> {
  int reponse = 1;
  List<Repo> listeRepos = [];

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

  void rafraichir(List<Repo> listeRecu) {
    listeRepos = [];
    listeRepos = List.from(listeRecu);
    setState(() {});
  }

  final controller = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child:
                    TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          hintText: 'Type User'
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                      onPressed: () async {
                        var response = await httpComplex(controller.text);
                        rafraichir(response);
                      },
                      child: Icon(Icons.search),
                    )
                  )
                ]
              )
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listeRepos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Nom : ${listeRepos[index].name} Private : ${listeRepos[index].private}'),
                  );
                },
              ),
            ),
          ],
        ),
    );
  }
}