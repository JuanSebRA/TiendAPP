
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
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
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(child: Text("Registra tus Compras")),titleTextStyle: TextStyle(fontSize:25,
          color: Colors.black,fontFamily: 'letra',
          fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
        ),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: TextField(
                      controller: buscar,style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                    onChanged: (value){
                      setState(() {
                      }
                      );
                    },
                    decoration: InputDecoration(
                      hintText: "Buscar (moda,alimento)",
                      hintStyle: TextStyle(
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

    final Stream<QuerySnapshot> consultar=FirebaseFirestore.instance.collection('productos').where('categoria',isEqualTo: dato.toLowerCase()).snapshots();

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
                                color: Colors.black,
                                child:ListTile(
                                  title: Text(data['nombre'],style: TextStyle(fontSize: 20,color: Colors.white),),
                                  trailing: Text(data['precio'],style: TextStyle(fontSize: 20,color: Colors.white),
                                  ),
                                  onTap: (){
                                    lista.add([data['nombre'],data['precio']]);
                                  },
                                ),
                              ),
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
            color: Colors.black,
            child: ElevatedButton.icon(
              label: Text("ver compra",style: TextStyle(fontSize: 20,color: Colors.white),
                textAlign: TextAlign.center,
              ),
              icon: Icon(Icons.add_shopping_cart_sharp,
                size: 30,
                color: Colors.white,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> list(lista:lista)));
              },
            ),
          ),
        )
      ],
    );
  }
}