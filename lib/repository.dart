import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoapp/person.dart';

class Repository {
  Stream<List<Person>> getAllPeople() {
    return Firestore.instance.collection("people")
        .snapshots()
        .map((querySnapshot){
          return querySnapshot.documents.map((document){
            return Person(document['name'], document['token']);
          }).toList();
    });
  }

  void saveNewPerson(Person person) {
    // TODO
  }
}
