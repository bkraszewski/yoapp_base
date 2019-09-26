import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yoapp/messaging.dart';
import 'package:yoapp/person.dart';
import 'package:yoapp/repository.dart';

void main() => runApp(YoApp());

class YoApp extends StatelessWidget {

  final repository = Repository();
  final messeging = Messaging();


  void _onNewUserAdded(String name) async {
    var token = await messeging.getToken();
    var person = Person(name, token);
    repository.saveNewPerson(person);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
        backgroundColor: Colors.green,
        body: StreamBuilder<List<Person>>(
          stream: repository.getAllPeople(),
          builder: (streamContext, snapshot) {
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
        floatingActionButton: AddNewUserButton(callback: _onNewUserAdded)));
  }
}

class AddNewUserButton extends StatelessWidget {

  final Function(String) callback;

  AddNewUserButton({this.callback});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => _onNewUserRequested(context),
    );
  }

  void _onNewUserRequested(BuildContext context) async {
    final TextEditingController _textController = TextEditingController();

    showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Add new user"),
            content: TextField(decoration: InputDecoration(hintText: "Name"),
              controller: _textController,),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  callback(_textController.text.toString());
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}


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
