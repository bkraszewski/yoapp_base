import 'package:firebase_messaging/firebase_messaging.dart';

const String MESSAGE_URL = 'https://fcm.googleapis.com/fcm/send';
const String MESSAGE_HEADER = 'AAAAIJ4H_ZE:APA91bFlG9oq5QWkHQPuchgxR0rG__gMMVk0BK32IhxIX5xyvPiUDqEwL2LnX-byuDHVKrblXENJiSybOCIxUf_fnz0RtNVKJeUrrsQwGUeWqPobmIAu-6cG3VkVfA5AgbqMhrQHdRCk'; // TODO put API key here

class Messaging {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Future<String> getToken() {
    return _firebaseMessaging.getToken();
  }

  void sendMessage(String token) {
    // TODO
  }
}
