import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:yoapp/player.dart';

import 'message_body.dart';

const String MESSAGE_URL = 'https://fcm.googleapis.com/fcm/send';
const String MESSAGE_HEADER = 'key=AAAAIJ4H_ZE:APA91bFlG9oq5QWkHQPuchgxR0rG__gMMVk0BK32IhxIX5xyvPiUDqEwL2LnX-byuDHVKrblXENJiSybOCIxUf_fnz0RtNVKJeUrrsQwGUeWqPobmIAu-6cG3VkVfA5AgbqMhrQHdRCk'; // TODO put API key here

class Messaging {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final player = Player();

  Future<String> getToken() {
    return _firebaseMessaging.getToken();
  }

  void init(){
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async{
        print("received message");
        player.playSound();
      }
    );
  }

  void sendMessage(String token) async {
    final url = MESSAGE_URL;
    final body = MessageBody.create(token).toJson();
    final headers = {HttpHeaders.authorizationHeader: MESSAGE_HEADER};

    http.post(url, body: body, headers: headers).then(
          (http.Response response) {
        final int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode > 400) {
          throw new Exception("Error while fetching data");
        }else{
          print("Status is: $statusCode");
        }
      },
    );
  }
}
