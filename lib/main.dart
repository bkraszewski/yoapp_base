import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yoapp/person.dart';
import 'package:yoapp/repository.dart';

void main() => runApp(YoApp());

class YoApp extends StatelessWidget {

  var repository = Repository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      backgroundColor: Colors.green,
      body: StreamBuilder<List<Person>>(
        stream: repository.getAllPeople(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');

          switch (snapshot.connectionState) {
            case ConnectionState.waiting :
              return Text("Loading...");
            default:
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, position) {
                    return YoListItem(snapshot.data[position]);
                  });
          }
        },
      ),
    ));
  }
}

//ListView.builder(
//itemCount: persons.length,
//itemBuilder: (context, position) {
//return YoListItem(persons[position]);
//})

class YoListItem extends StatelessWidget {

  final Person person;

  YoListItem(this.person);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(person.name.toUpperCase(),
          style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,),),
    );
  }

}
