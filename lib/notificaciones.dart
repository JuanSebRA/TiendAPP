import 'package:flutter/material.dart';
import 'notificacion.dart';

class notificaciones extends StatefulWidget {
  const notificaciones({Key? key}) : super(key: key);

  @override
  _notificacionesState createState() => _notificacionesState();
}

class _notificacionesState extends State<notificaciones> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final obj=new notificacion();
    obj.noti();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("mensaje"),
        ),
      ),
    );
  }
}