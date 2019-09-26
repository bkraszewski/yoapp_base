import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(YoApp());

class YoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var persons = ["Welcome", "To", "Programistok"];

    return MaterialApp(home: Scaffold(
      backgroundColor: Colors.green,
      body: ListView.builder(
          itemCount: persons.length,
          itemBuilder: (context, position) {
            return YoListItem(persons[position]);
          }),
    ));
  }
}

class YoListItem extends StatelessWidget{

  final String name;

  YoListItem(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(name.toUpperCase(),
          style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,),),
    );
  }

}
