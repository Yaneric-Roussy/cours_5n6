import 'package:flutter/material.dart';
import 'package:yaneric_pages_recent/Details.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => MyDrawerState();
}

class MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    var listView = ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 200,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Column(
            children: [
              Text('Mon super tiroir bleu'),
              Text('Yanéric Roussy'),
              Text('2243398')
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.abc),
          title: const Text("Détails"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(),
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
