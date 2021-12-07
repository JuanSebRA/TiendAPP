import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
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

class push{
  FirebaseMessaging noty=FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _saje=new StreamController.broadcast();

  static Stream<String> get messageString=>_saje.stream;

  static Future _backgroundMandler(RemoteMessage message)async{
    print(message.data);
    _saje.add(message.notification?.title??'no title');
  }
  static Future _onMessagedHandler(RemoteMessage message)async{
    print(message.data);
    _saje.add(message.notification?.title??'no title');
  }
  static Future _onMessagedOpenHandler(RemoteMessage message)async{
    print(message.data);
    _saje.add(message.notification?.title??'no title');
  }
  static Future initializeApp()async{
    await Firebase.initializeApp();
    token=await FirebaseMessaging.instance.getToken();
    print(token);
    FirebaseMessaging.onBackgroundMessage(_backgroundMandler);
    FirebaseMessaging.onMessage.listen(_onMessagedHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessagedOpenHandler);
  }
}