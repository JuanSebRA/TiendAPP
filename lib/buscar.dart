
import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'buscas.dart';
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
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text("Busca tu Producto",style: TextStyle(fontSize:30,
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

class categoria extends StatelessWidget {
  const categoria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Proyecto Tienda',
        darkTheme: ThemeData(
        primarySwatch: Colors.red,
    ),
    home: Container(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Center(
              child: const Text('Elige la Categoria',
                style: TextStyle(fontSize:30,
                  color: Colors.black,fontFamily: 'letra',
                  fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationStyle: TextDecorationStyle.wavy
                ),
              ),
            ),
          ),
          body: ListView(
              padding: const EdgeInsets.only(top: 50),
              children: <Widget>[
          Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
      color: Colors.red,
    ),
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(20),
      child: TextButton.icon(
          label: Center(
            child: Text("productos",
              style: TextStyle(fontSize:30,
              color: Colors.white,fontFamily: 'letra',
              fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
            ),),
          ),
          icon: const Icon(Icons.add,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>buscar()),
            );
          },
        ),
      ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Colors.red,
                  ),
                  margin: EdgeInsets.only(top: 100),
                  padding: EdgeInsets.all(20),
                  child: TextButton.icon(
                    label: Center(
                      child: Text("Servicios",
                        style: TextStyle(fontSize:30,
                          color: Colors.white,fontFamily: 'letra',
                          fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
                        ),),
                    ),
                    icon: const Icon(Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>buscas()),
                      );
                    },
                  ),
                ),
    ],
          ),
    ),
    ),
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