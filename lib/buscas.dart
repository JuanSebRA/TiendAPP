import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'consultas.dart';

class buscas extends StatefulWidget {
  const buscas({Key? key}) : super(key: key);
  @override
  _buscasState createState() => _buscasState();
}

class _buscasState extends State<buscas> {
  TextEditingController buscar=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text("Busca tu Servicio",style: TextStyle(fontSize:30,
              color: Colors.black,fontFamily: 'letra',
              fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
            ),
            ),
          ),
        ),
        body: Center(
          child: SizedBox(width: 360,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: buscar,style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                    onChanged: (value){
                      setState(() {
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Digite informacion a buscar",hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                      icon: const Icon(Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: datos(
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

class datos extends StatelessWidget {
  final String text;

  const datos({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Stream<QuerySnapshot>data=FirebaseFirestore.instance.collection("negocios").where('nombre',isEqualTo: text.toLowerCase()).snapshots();
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
                  subtitle: Text(data['actividad']),
                  leading: Image.network(data['imagen']),
                  onTap: (){
                    clientes clie=clientes(data['nombre'], data['imagen'], data['categoria'], data['web'], data['actividad'], data['celular'], data['direccion'], data['telefono']);
                    Navigator.push(context,
                      //MaterialPageRoute(builder: (context)=> consulta(data['web'])
                      //MaterialPageRoute(builder: (context)=> consulta(data['imagen'])
                      MaterialPageRoute(builder: (context)=> consultas(clie:clie)
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


class clientes{
  String nom="";
  String img="";
  String cat="";
  String web="";
  String act="";
  String cel="";
  String dir="";
  String tel="";

  clientes(this.nom, this.img, this.cat, this.web, this.act, this.cel, this.dir, this.tel);

}