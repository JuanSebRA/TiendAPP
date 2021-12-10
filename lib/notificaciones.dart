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
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Mensajes",style: TextStyle(fontSize:30,
            color: Colors.black,fontFamily: 'letra',
            fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
          ),)
        ),
      ),
    );
  }
}

class home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Center(
          child: Text("Mensajes",style: TextStyle(fontSize:30,
            color: Colors.black,fontFamily: 'letra',
            fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
          ),),
        ),
      ),
      body: Center(
        child: Text("No tiene mensajes",style: TextStyle(fontSize: 20,color: Colors.white),),
      ),
    );
  }
}

class mensaje extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mensaje:"),
      ),
      body: Center(
        child: Text("Cuerpo"),
      ),
    );
  }
}