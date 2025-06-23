import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaneric_web_service_recent/animal.dart';
import 'package:yaneric_web_service_recent/animal_widget.dart';
import 'package:yaneric_web_service_recent/http.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

double sliderValue = 0;
int index = sliderValue.round();
final familleController = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {

  final List<String> continents = [
    'monde',
    'afrique',
    'asie',
    'europe',
    'amérique',
    'océans',
    'antarctique',
  ];

  List<Animal> listeAnimaux = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Les animaux de mon zoo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: CupertinoColors.lightBackgroundGray,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Text('Continent', textAlign: TextAlign.start,),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      showValueIndicator: ShowValueIndicator.always,
                      valueIndicatorTextStyle: const TextStyle(color: Colors.white),
                    ),
                    child: Slider(
                      value: sliderValue,
                      min: 0,
                      max: (continents.length - 1).toDouble(),
                      divisions: continents.length - 1,
                      label: continents[index],
                      onChanged: (double value) {
                        setState(() {
                          sliderValue = value;
                          index = sliderValue.round();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                        controller: familleController,
                        decoration: InputDecoration(
                            hintText: 'Famille'
                        )
                    )
                  ),

                ],
              )
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: ListView.builder(
                  itemCount: listeAnimaux.length,
                  itemBuilder: (context, index) {
                    return animal_widget(animalsList: listeAnimaux, context: context, index: index);
                  }
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Chercher animaux'),
        icon: Icon(Icons.search),
        onPressed: () async {
          listeAnimaux = await lookupAnimals(continents[index], familleController.text);
          setState(() {});
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
