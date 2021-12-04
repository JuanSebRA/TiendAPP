
import "package:flutter/material.dart";
//import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'buscar.dart';

class consulta extends StatefulWidget {
  //final dat;
  final cliente cli;

  //const consulta(this.dat,{Key? key}) : super(key: key);
  consulta({required this.cli});

  @override
  _consultaState createState() => _consultaState();
}

class _consultaState extends State<consulta> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Consultas'),
          ),
          body: Center(
            child: Container(
              color: Colors.green,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              height: 300,
              child: Center(
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  color: Color.fromARGB(100, 100, 100, 100),
                  child: Column(
                    children: [
                      //Image.network(widget.dat,width: 300,),
                      Image.network(widget.cli.img,width: 300,),
                      Text(widget.cli.img),

                      Container(
                        padding: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: ElevatedButton.icon(
                          label: Text('web',textAlign: TextAlign.center,
                          ),
                          icon:Icon(Icons.ten_k_sharp,
                            size: 20,color: Colors.black,
                          ),
                          onPressed: () async{
                            if(await canLaunch(widget.cli.web)){
                              await launch(widget.cli.web);
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