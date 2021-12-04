
import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'consulta.dart';

class buscar extends StatefulWidget {
  const buscar({Key? key}) : super(key: key);
  @override
  _buscarState createState() => _buscarState();
}

class _buscarState extends State<buscar> {
  TextEditingController buscar=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Informacion"),
        ),
        body: Center(
          child: SizedBox(width: 360,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: buscar,
                    onChanged: (value){
                      setState(() {
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Digite informacion a buscar"
                    ),
                  ),
                ),
                Expanded(
                  child: dato(
                    text: buscar.text.toLowerCase(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class dato extends StatelessWidget {
  final String text;

  const dato({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Stream<QuerySnapshot>data=FirebaseFirestore.instance.collection("productos").where('nombre',isEqualTo: text.toLowerCase()).snapshots();
    //final Stream<QuerySnapshot>data=FirebaseFirestore.instance.collection("clientes").where('idioma',arrayContainsAny: [text]).snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: data,
      builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document){
              Map<String,dynamic> data=document.data()! as Map<String,dynamic>;
              return Container(
                color: Colors.red,
                margin: EdgeInsets.all(20),
                child: ListTile(
                  title: Text(data['nombre']),
                  subtitle: Text(data['precio']),
                  leading: Image.network(data['imagen']),
                  onTap: (){
                    cliente cli=cliente(data['nombre'], data['precio'], data['imagen'], data['categoria'], data['web']);
                    Navigator.push(context,
                      //MaterialPageRoute(builder: (context)=> consulta(data['web'])
                      //MaterialPageRoute(builder: (context)=> consulta(data['imagen'])
                      MaterialPageRoute(builder: (context)=> consulta(cli:cli)
                      ),
                    );
                  },
                ),

              );
            }
            ).toList()
        );
      },

    );
  }
}

class cliente{
  String nom="";
  String pre="";
  String img="";
  String cat="";
  String web="";

  cliente(this.nom, this.pre, this.img, this.cat, this.web);

}