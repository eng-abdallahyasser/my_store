import 'package:firebase_messaging/firebase_messaging.dart';

class MyMassaging {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<String?> getToken() async {
    
    return await _messaging.getToken();
  }
}
