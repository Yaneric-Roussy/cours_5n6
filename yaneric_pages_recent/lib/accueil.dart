
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaneric_pages_recent/drawer_nav.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Accueil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Text('Bleu 2/3',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text('Rouge 2/3',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: Text('Vert',style: TextStyle(color: Colors.white)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.yellow,
                alignment: Alignment.center,
                child: Text('jaune'),
                margin: EdgeInsets.all(8),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.orange,
                      alignment: Alignment.center,
                      child: Text('Orange 1/4', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.pink,
                      alignment: Alignment.center,
                      child: Text('Rose 1/4', style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
