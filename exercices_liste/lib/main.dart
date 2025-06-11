import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Exercice ordre alpha'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ListeElement {
  late int id;
  late String nom;

  ListeElement(int id, String nom){
    this.id = id;
    this.nom = nom;
  }
}

List<ListeElement> listeFix = [
  ListeElement(1, "Antoine"),
  ListeElement(2, "Anntouane"),
  ListeElement(3, "Anttoine"),
  ListeElement(4, "Avoine"),
  ListeElement(5, "Entouane")
];

class _MyHomePageState extends State<MyHomePage> {

  List<ListeElement> listeMix = [];

  @override
  void initState() {
    super.initState();

    //listeMix = listeFix;    <-- that actually makes it share the same memory, thats why listefix would get shuffled as well
    listeMix = List.from(listeFix);
    //listeMix.shuffle();

  }

  void bringUpName(int index, BuildContext context) {
    if(index != 0){
      ListeElement temp = listeMix[(index - 1)];
      listeMix[(index - 1)] = listeMix[index];
      listeMix[index] = temp;

      if(checkIfMatch()){
        // On recommence
        listeMix.shuffle();

        // Show SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Liste en ordre! On reshuffle')),
        );
      }
    }
    setState(() {});
  }

  void bringDownName(int index, BuildContext context) {
    if(index != 4){
      ListeElement temp = listeMix[(index + 1)];
      listeMix[(index + 1)] = listeMix[index];
      listeMix[index] = temp;

      if(checkIfMatch()){
        // On recommence
        listeMix.shuffle();

        // Show SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Liste en ordre! On reshuffle')),
        );
      }
    }
    setState(() {});
  }


  bool checkIfMatch(){
    for(var i = 0; i < listeFix.length; i++){
      var temp = listeFix[i];
      var temp1 = listeMix[i];
      if(listeFix[i] != listeMix[i]){
        return false;
      }
    }
    return true;
  }



  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(content: Text('Liste en ordre! On reshuffle'));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child:
          ListView.builder(
            itemCount: listeMix.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listeMix[index].nom),
                subtitle: Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        bringUpName(index, context);
                      },
                      child: Icon(Icons.arrow_upward, color: Colors.white),
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    MaterialButton(
                      onPressed: () {
                        bringDownName(index, context);
                      },
                      child: Icon(Icons.arrow_downward, color: Colors.white),
                      color: Colors.black,
                    ),
                  ],
                ),
              );
            },
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: initState,
        child: Text('Mix'),
      ),
    );
  }


}
