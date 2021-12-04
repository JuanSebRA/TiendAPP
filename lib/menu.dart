
import 'package:flutter/material.dart';

class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
      ),
        home:Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("Menu"),
          ),
          drawer: Drawer(
              child: ListView(
                children: [
                  Container(
                    color: Colors.red,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(30),
                    child: ListTile(
                      title: const Text(
                        'Configuracion',
                        style: TextStyle(fontSize:20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
                        ),
                      ),
                      leading: Icon(
                        Icons.brightness_7_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              )
          ),
        ),
    );
  }
}