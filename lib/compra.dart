
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'carrito.dart';

class compra extends StatefulWidget {
  const compra({Key? key}) : super(key: key);

  @override
  _compraState createState() => _compraState();
}

class _compraState extends State<compra> {
  TextEditingController buscar=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("compras"),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: buscar,
                    onChanged: (value){
                      setState(() {

                      }
                      );
                    },
                    decoration: InputDecoration(
                        hintText: "nombre negocio"
                    ),
                  ),
                ),
                Expanded(
                    child: negocio(dato:buscar.text.toLowerCase())
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class negocio extends StatelessWidget {
  final String dato;
  final List lista=[];
  negocio({Key? key,required this.dato}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> consultar=FirebaseFirestore.instance.collection('productos').where('codigo_almacen',isEqualTo: dato.toLowerCase()).snapshots();

    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 5),
              color: Colors.red,
              child: StreamBuilder<QuerySnapshot>(
                stream: consultar,
                builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  return ListView(
                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String,dynamic> data=document.data()!as Map<String, dynamic>;
                        return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top:10),
                                height:100,
                                color: Colors.red,
                                child:ListTile(
                                  title: Text(data['nombre']),
                                  subtitle: Text(data['precio']),
                                  onTap: (){
                                    lista.add([data['nombre'],data['precio']]);
                                    //lista.add(data['precio']);
                                  },
                                ),
                              )
                            ]
                        );
                      }
                      ).toList()
                  );
                },
              ),
            )
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(20),
            height: 100,
            color: Colors.red,
            child: ElevatedButton.icon(
              label: Text("ver compra",
                textAlign: TextAlign.center,
              ),
              icon: Icon(Icons.eleven_mp_rounded,
                size: 30,
                color: Colors.black,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> carro(lista:lista)));
              },
            ),
          ),
        )
      ],
    );
  }
}