import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class  lista extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mi lista de productos"),
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
  final Stream<QuerySnapshot> producto = FirebaseFirestore.instance.collection("productos").snapshots();
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
                      Icons.add_to_home_screen,
                      color: Colors.black,
                      size: 30,

                    ),
                    title: Text(data['categoria']),
                    subtitle: Text(data['codigo_almacen']),
                    trailing: Text(data['precio']),
                  ),
                );

              }
              ).toList()
          );
        }
    );
  }
}