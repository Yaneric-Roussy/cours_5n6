import 'package:flutter/material.dart';
import 'package:simple_nav/truc.dart';

// TODO Un ecran minimal avec un tres peu de code
class EcranC extends StatefulWidget {
  const EcranC({super.key, required this.truc1, required this.truc2, required this.truc3, required this.truc4, required this.truc5});

  final Truc truc1;
  final Truc truc2;
  final Truc truc3;
  final Truc truc4;
  final Truc truc5;

  @override
  State<EcranC> createState() => _EcranCState();
}

class _EcranCState extends State<EcranC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Écran avec les objets'),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Voice le data', style: TextStyle(fontSize: 30)),
            Text('Id : ' + widget.truc1.Id.toString() + ' Name : ' + widget.truc1.Nom.toString()),
            Text('Id : ' + widget.truc2.Id.toString() + ' Name : ' + widget.truc2.Nom.toString()),
            Text('Id : ' + widget.truc3.Id.toString() + ' Name : ' + widget.truc3.Nom.toString()),
            Text('Id : ' + widget.truc4.Id.toString() + ' Name : ' + widget.truc4.Nom.toString()),
            Text('Id : ' + widget.truc5.Id.toString() + ' Name : ' + widget.truc5.Nom.toString()),
          ],
        ),
      ),
    );
  }
}
