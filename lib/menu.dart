
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
      backgroundColor: Colors.grey,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              //color: Color.fromARGB(30, 255, 0, 0)
                gradient: LinearGradient(colors: [Colors.red, Colors.black], begin: Alignment.topCenter, end: Alignment.bottomCenter)
            ),
            accountName: Text("Admin",style: TextStyle(fontSize:20,
              color: Colors.red,
              fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
            ),),
            accountEmail: Text("123@gmail.com",style: TextStyle(fontSize:20,
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
          ListTile(
              tileColor: Colors.black,
              title: Text('Informacion Usuario',style: TextStyle(fontSize:20,
                color: Colors.red,fontFamily: 'letra',
                fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
              ),),
              leading: Icon(Icons.people,
                  color: Colors.white,
                  size: 50),
              onTap: (){
                Navigator.pop(context);
              }
          ),
          ListTile(
              tileColor: Colors.black,
              title: Text('Geolocalizacion',style: TextStyle(fontSize:20,
                color: Colors.red,fontFamily: 'letra',
                fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
              ),),
              leading: Icon(Icons.add_business,
                  color: Colors.white,
                  size: 50),
              onTap: (){
                Navigator.pop(context);
              }
          ),
          ListTile(
              tileColor: Colors.black,
              title: Text('Pedidos',style: TextStyle(fontSize:20,
                color: Colors.red,fontFamily: 'letra',
                fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
              ),),
              leading: Icon(Icons.money,
                  color: Colors.white,
                  size: 50),
              onTap: (){
                Navigator.pop(context);
              }
          ),
          ListTile(
              tileColor: Colors.black,
              title: Text('Cuenta',style: TextStyle(fontSize:20,
                color: Colors.red,fontFamily: 'letra',
                fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
              ),),
              leading: Icon(Icons.account_box,
                  color: Colors.white,
                  size: 50),
              onTap: (){
                Navigator.pop(context);
              }
          ),
          ListTile(
              tileColor: Colors.black,
              title: Text('Informacion Negocio',style: TextStyle(fontSize:20,
                color: Colors.red,fontFamily: 'letra',
                fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
              ),),
              leading: Icon(Icons.house,
                  color: Colors.white,
                  size: 50),
              onTap: (){
                Navigator.pop(context);
              }
          ),
          ListTile(
              tileColor: Colors.black,
              title: Text('Salir',style: TextStyle(fontSize:20,
                color: Colors.red,fontFamily: 'letra',
                fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
              ),),
              leading: Icon(Icons.arrow_back_rounded,
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