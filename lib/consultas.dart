import "package:flutter/material.dart";
//import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'buscas.dart';

class consultas extends StatefulWidget {
  //final dat;
  final clientes clie;

  //const consulta(this.dat,{Key? key}) : super(key: key);
  consultas({required this.clie});

  @override
  _consultasState createState() => _consultasState();
}

class _consultasState extends State<consultas> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Center(child: Text('Informacion',style: TextStyle(fontSize: 50,color: Colors.black),)),
          ),
          body: Center(
            child: Container(
              color: Colors.red,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              //height: 300,
              child: Center(
                child: Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  color: Color.fromARGB(100, 100, 100, 100),
                  child: Column(
                    children: [
                      //Image.network(widget.dat,width: 300,),
                      Image.network(widget.clie.img,width: 300,),
                      Text(widget.clie.nom,style: TextStyle(fontSize: 30,color: Colors.white),),
                      Text(widget.clie.act,style: TextStyle(fontSize: 30,color: Colors.white),),
                      Text(widget.clie.cel,style: TextStyle(fontSize: 30,color: Colors.white),),
                      Text(widget.clie.tel,style: TextStyle(fontSize: 30,color: Colors.white),),
                      Text(widget.clie.dir,style: TextStyle(fontSize: 30,color: Colors.white),),

                      Container(
                        padding: EdgeInsets.only(top: 50),
                        alignment: Alignment.center,
                        child: ElevatedButton.icon(
                          label: Text('web',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.black),
                          ),
                          icon:Icon(Icons.web,
                            size: 50,color: Colors.white,
                          ),
                          onPressed: () async{
                            if(await canLaunch(widget.clie.web)){
                              await launch(widget.clie.web);
                            }

                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}