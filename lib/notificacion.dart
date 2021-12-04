
import 'package:firebase_messaging/firebase_messaging.dart';

class notificacion {

  FirebaseMessaging n = FirebaseMessaging.instance;

  noti(){
    n.requestPermission();
    n.getToken().then((token){
      print("el token");
      print(token);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("firebase");
    });
  }
}