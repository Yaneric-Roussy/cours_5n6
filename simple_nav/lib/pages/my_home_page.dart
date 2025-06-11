import 'package:flutter/material.dart';
import 'package:simple_nav/pages/ecran_a.dart';
import 'package:simple_nav/pages/ecran_b.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text('Exercice simple_nav et liste_nav'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EcranA(),
                  ),
                );
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.black)
              ),
              child: const Text(
                'Aller au deuxième écran',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.blue
                ),),
            ),
            SizedBox(height: 20),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EcranB(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.black)
                ),
                child: const Text(
                  'Exercice liste_nav',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.red
                  ),
                ))
          ],
        ),
      )
    );
  }
}