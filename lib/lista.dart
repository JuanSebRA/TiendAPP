import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiendapp/productos.dart';

class  lista extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(child: Text("lista de productos y servicios")),titleTextStyle: TextStyle(fontSize:20,
          color: Colors.black,fontFamily: 'letra',
          fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
        ),
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
                  color: Colors.black,
                  margin: EdgeInsets.only(top:10),
                  child: ListTile(
                    leading: IconButton(
                      tooltip: 'Mas Informacion',
                      icon: const Icon(Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>productos()),
                        );
                        /*Firestore.instance.collection("productos").getDocuments().then((querySnapshot){
                          querySnapshot.documents.forEach((element){
                            List value = element.data["producto"];
                            Firestore.instance.collection("items").document(value[0]).get().then((value){
                              print(value.data);
                            });
                          });
                        });*/
                      },
                    ),
                    title: Image.network(data['imagen'],width: 100,height: 100,),
                    subtitle: Center(child: Text(data['nombre'],style: TextStyle(fontSize: 15,color: Colors.red),)),
                    trailing: Text(data['precio'],style: TextStyle(fontSize: 15,color: Colors.red),),
                  ),
                );

              }
              ).toList()
          );
        }
    );
  }
}