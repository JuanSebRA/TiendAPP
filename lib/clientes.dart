import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Clientes extends StatelessWidget {
  const Clientes({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: registro(),
    );
  }
}
class registro  extends StatefulWidget {

  @override
  _registroState createState() => _registroState();
}

class _registroState extends State<registro> {

  final pass=TextEditingController();
  final nom=TextEditingController();
  final cel=TextEditingController();
  final dir=TextEditingController();
  final tel=TextEditingController();
  final user=TextEditingController();

  CollectionReference datcli=FirebaseFirestore.instance.collection('clientes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text("Nuestros Clientes")),
      ),
      body: ListView(
        children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 10)
          ),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.only(left: 60,right: 60),
              child: TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  hintText: "Nombre Completo",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 60,right: 60),
              margin: EdgeInsets.all(20),
              child: TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  hintText: "Direccion",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 60,right: 60),
              margin: EdgeInsets.all(20),
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  hintText: "Celular",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 60,right: 60),
              margin: EdgeInsets.all(20),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  hintText: "Correo Electronico",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 60,right: 60),
              margin: EdgeInsets.all(20),
              child: TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  hintText: "Usuario",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 60,right: 60),
              margin: EdgeInsets.all(20),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  hintText: "Contraseña",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text("Registrar",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),

                onPressed: () {
                  if(pass.text.isEmpty||nom.text.isEmpty||cel.text.isEmpty||dir.text.isEmpty||tel.text.isEmpty||user.text.isEmpty){
                    Fluttertoast.showToast(msg: "llene todos los campos",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER
                    );
                  }
                  else{
                    datcli.doc(pass.text).set({
                      "nombre":nom.text,
                      "celular":cel.text,
                      "direccion":dir.text,
                      "telefono":tel.text,
                      "user":user.text,
                    });

                    Fluttertoast.showToast(msg: "Datos",
                        fontSize: 20,
                        backgroundColor: Colors.grey,
                        textColor: Colors.red,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM
                    );
                  }
                },
              )
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text("Actualizar",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              onPressed: (){
                datcli.doc(pass.text).update({
                  "nombre":nom.text,
                  "celular":cel.text,
                  "direccion":dir.text,
                  "telefono":tel.text,
                  "user":user.text,
                });

                Fluttertoast.showToast(msg: "Datos actualizados",
                    fontSize: 20,
                    backgroundColor: Colors.grey,
                    textColor: Colors.red,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text("Eliminar",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              onPressed: (){
                datcli.doc(pass.text).delete();

                Fluttertoast.showToast(msg: "Datos eliminados",
                    fontSize: 20,
                    backgroundColor: Colors.grey,
                    textColor: Colors.red,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
