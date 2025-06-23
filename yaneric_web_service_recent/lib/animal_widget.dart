import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaneric_web_service_recent/animal.dart';

class animal_widget extends StatelessWidget {
  const animal_widget({
    super.key,
    required this.animalsList,
    required this.context,
    required this.index,
  });

  final List<Animal> animalsList;
  final BuildContext context;
  final int index;

  @override
  @override
  Widget build(BuildContext context) {
    final Animal item = animalsList[index];
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: CupertinoColors.lightBackgroundGray,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          item.continent == "Océans" ?
          Icon(Icons.water) :
          Icon(Icons.landscape),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${item.nom}', style: TextStyle(fontWeight: FontWeight.w900),),
              Text('${item.famille}')
            ],
          )
        ],
      ),
    );
  }
}