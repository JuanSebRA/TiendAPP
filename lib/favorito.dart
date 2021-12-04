import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class  favorito extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mi lista de compras anteriores"),
        ),
        body: (
            Productoslista()
        ),
      ),
    );
  }
}


class Productoslista extends StatefulWidget {
  const Productoslista({Key? key}) : super(key: key);

  @override
  _ProductoslistaState createState() => _ProductoslistaState();
}

class _ProductoslistaState extends State<Productoslista> {
  final Stream<QuerySnapshot> producto = FirebaseFirestore.instance.collection("ventas").snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: producto,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Text('no tiene datos');
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Text('Cargando...');
          }
          return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document){
                Map<String,dynamic> data=document.data()! as Map<String,dynamic>;
                return Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top:10),
                  child: ListTile(
                    leading: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,

                    ),
                    title: Text(data['producto']),
                    subtitle: Text(data['valor']),
                  ),
                );

              }
              ).toList()
          );
        }
    );
  }
}