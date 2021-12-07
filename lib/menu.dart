
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {

  @override
  Widget build(BuildContext context) {
    //CupertinoColors.darkBackgroundGray;
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              //color: Color.fromARGB(30, 255, 0, 0)
                gradient: LinearGradient(colors: [Colors.red, Colors.black], begin: Alignment.topCenter, end: Alignment.bottomCenter)
            ),
            accountName: Text("Usuario",style: TextStyle(fontSize:20,
              color: Colors.red,
              fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
            ),),
            accountEmail: Text("Email",style: TextStyle(fontSize:20,
              color: Colors.red,
              fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
            ),),
            currentAccountPicture: Image.asset("BlackFolder/12.jpg"),
          ),
          ListTile(
              tileColor: Colors.black,
              title: Text('Configuracion',style: TextStyle(fontSize:20,
                color: Colors.red,fontFamily: 'letra',
                fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
              ),),
              leading: Icon(Icons.brightness_7_outlined,
                  color: Colors.white,
                  size: 50),
              onTap: (){
                Navigator.pop(context);
              }
          ),
          /*ListTile(
              tileColor: Colors.black,
              title: Text('clientes',style: TextStyle(fontSize:20,
                color: Colors.red,fontFamily: 'letra',
                fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
              ),),
              leading: Image.asset("BlackFolder/13.jpg"),
              onTap: (){
                Navigator.pop(context);
              }
          ),*/
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup Menu Example - FlutterCorner'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            'Show Pop-up',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.black,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
          },
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Popup example'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hello"),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}

/*Icons.brightness_7_outlined,
color: Colors.white,
size: 50,
),
onTap: (){
Navigator.pop(context);
},*/