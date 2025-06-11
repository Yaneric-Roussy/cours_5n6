import 'package:flutter/material.dart';

class EcranA extends StatefulWidget {
  const EcranA({super.key});

  @override
  State<EcranA> createState() => _EcranAState();
}

class _EcranAState extends State<EcranA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecran A'),
      ),
      body: const Text('Deuxième Écran yiipee'),
    );
  }
}
