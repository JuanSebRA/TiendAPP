import "package:flutter/material.dart";
//import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'lista.dart';


class productos extends StatefulWidget {
  //final dat;
  final client clie;

  //const consulta(this.dat,{Key? key}) : super(key: key);
  productos({required this.clie});

  @override
  _productosState createState() => _productosState();
}

class _productosState extends State<productos> {
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
                      Text(widget.clie.nom,style: TextStyle(fontSize: 50,color: Colors.white),),
                      Text(widget.clie.pre,style: TextStyle(fontSize: 50,color: Colors.white),),

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



class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Add Values in String Array in Flutter"),
          ),
          body: SafeArea(
              child: Center(
                child: AppWidget(),
              ))),
    );
  }
}

class AppWidget extends StatefulWidget {
  @override
  AppWidgetState createState() => AppWidgetState();
}

class AppWidgetState extends State<AppWidget> {
  final textFieldValueHolder = TextEditingController();

  final List<String> data = <String>['A', 'B', 'C', 'D'];

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Please Enter Value in Text Field.'),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void addValue() {
    if (textFieldValueHolder.text == '') {
      showAlert(context);
    } else {
      setState(() {
        data.add(textFieldValueHolder.text);
      });
      print(data);
    }
  }

  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 280,
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: textFieldValueHolder,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Enter Some Text Here'),
                )),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  padding: EdgeInsets.all(12),
                  textStyle: TextStyle(fontSize: 22),
                ),
                child: Text('Add Value To String Array'),
                onPressed: addValue,
              ),
            ),
            Text(
              '${data.join("," + " ")}',
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}