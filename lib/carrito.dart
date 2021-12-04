import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class carro extends StatelessWidget {
  List lista=[];
  carro({required this.lista});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: list(lista:[]),
    );
  }
}

class list extends StatefulWidget {
  List lista=[];
  list({required this.lista});

  @override
  _listState createState() => _listState();
}

class _listState extends State<list> {
  var total;
  CollectionReference datven=FirebaseFirestore.instance.collection('ventas');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Su compra"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount: widget.lista.length,
              itemBuilder: (BuildContext context,i){
                final item=widget.lista[i][0];
                return Dismissible(
                    onDismissed: (_){
                      widget.lista.removeAt(i);
                    },
                    movementDuration: Duration(milliseconds: 100),
                    key: Key(item),
                    child: Container(
                      color: Colors.red,
                      margin: EdgeInsets.all(5),
                      child: ListTile(
                        title: Text(widget.lista[i][0]+" "+widget.lista[i][1]),
                        //subtitle: Text(widget.lista[i][1]),
                      ),
                    )
                );
              },
            ),
          ),
          Container(
              padding: EdgeInsets.all(10),
              color: Colors.redAccent,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Builder(
                      builder:(context){
                        return ElevatedButton.icon(
                          label: Text("costo"),
                          icon: Icon(Icons.add,
                            size: 30,color: Colors.black,
                          ),
                          onPressed:(){
                            total=0;
                            var t;
                            for(int i=0;i<widget.lista.length;i++){
                              t=int.parse(widget.lista[i][1]);
                              total=t*total;
                              print(total);

                              Fluttertoast.showToast(msg: "su total es"+total.toString(),
                                  fontSize: 20,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.black,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER
                              );
                            }
                          },
                        );
                      }
                  ),
                  Container(
                    child: ElevatedButton.icon(
                      label: Text('Registrar su compra',
                        textAlign: TextAlign.center,
                      ),
                      icon: Icon(Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: (){
                        total=0;
                        var t;
                        for(int i=0;i<widget.lista.length;i++){
                          t=int.parse(widget.lista[i][1]);
                          total=t*total;
                          print(total);

                          Fluttertoast.showToast(msg: "Su total es"+total.toString(),
                              fontSize: 20,
                              backgroundColor: Colors.red,
                              textColor: Colors.black,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER
                          );
                        }
                        List newLis=[];
                        for(int i=0;i<widget.lista.length;i++){
                          newLis.add(widget.lista[i][0]);
                        }
                        datven.doc().set({
                          "producto":newLis,
                          "valor": total
                        });
                      },
                    ),
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}