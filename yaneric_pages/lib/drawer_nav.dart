import 'package:flutter/material.dart';
import 'package:yaneric_pages/am.dart';
import 'package:yaneric_pages/gram.dart';
import 'package:yaneric_pages/stram.dart';

class LeTiroir extends StatefulWidget {
  const LeTiroir({super.key});

  @override
  State<LeTiroir> createState() => LeTiroirState();
}

class LeTiroirState extends State<LeTiroir> {
  @override
  Widget build(BuildContext context) {
    var listView = ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 200,
        ),
        Text('Yaneric et 2243398'),
        Container(height: 100),
        ListTile(
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: const Text("Am"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(title: 'Am'),
              ),
            );
            // Then close the drawer
          },
        ),
        // ecran sans paramtre.
        ListTile(
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: const Text("Stram"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StramPage(title: 'Stram'),
              ),
            );
            // Then close the drawer
          },
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: const Text("Gram"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GramPage(title: 'Gram'),
              ),
            );
            // Then close the drawer
          },
        ),
      ],
    );

    return Drawer(
      child: Container(
        color: const Color(0xFFFFFFFF),
        child: listView,
      ),
    );
  }
}
