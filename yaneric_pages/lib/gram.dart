import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaneric_pages/am.dart';
import 'package:yaneric_pages/stram.dart';

class GramPage extends StatefulWidget {
  const GramPage({super.key, required this.title});

  final String title;

  @override
  State<GramPage> createState() => _GramPageState();
}

class _GramPageState extends State<GramPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 300,
              width: 300,
              child: Container(
                color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Gram'),
                    MaterialButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyHomePage(title: 'Am'),
                          ),
                        );
                      },
                      child: Text('Retour vers Am'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
