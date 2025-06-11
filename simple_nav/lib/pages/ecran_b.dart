import 'package:flutter/material.dart';
import 'package:simple_nav/pages/ecran_c.dart';
import 'package:simple_nav/truc.dart';

class EcranB extends StatefulWidget {
  const EcranB({super.key});

  @override
  State<EcranB> createState() => _EcranBState();
}

class _EcranBState extends State<EcranB> {
  Truc truc1 = Truc(1, 'Truc 1');
  Truc truc2 = Truc(2, 'Truc 2');
  Truc truc3 = Truc(3, 'Truc 3');
  Truc truc4 = Truc(4, 'Truc 4');
  Truc truc5 = Truc(5, 'YOGURT');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice liste_nav'),
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
                    builder: (context) => EcranC(
                      truc1: truc1,
                      truc2: truc2,
                      truc3: truc3,
                      truc4: truc4,
                      truc5: truc5,
                    ),
                  ),
                );
              },
              child: const Text('Click on me gurt'),
            ),
          ],
        ),
      )
    );
  }
}
