import 'package:flutter/material.dart';
import 'principal.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: pantalla(),
    );
  }
}
class pantalla  extends StatefulWidget {

  @override
  _pantallaState createState() => _pantallaState();
}

class _pantallaState extends State<pantalla> {

  final user=TextEditingController();
  final pass=TextEditingController();
  String u='';
  String p='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text("My App")),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Image.asset('BlackFolder/13.jpg'),
          ),
          Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: user,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  hintText: "Escriba Usuario",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
          ),
          Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: pass,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  hintText: "Escriba Contraseña",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
          ),
          Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text("Ingresar",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),

                onPressed: () {
                  u=user.text;
                  p=pass.text;
                  //print(u+p);
                  if(u=="admin" && p=="admin123"){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>TiendApp()),
                    );
                  }
                },
              )
          ),
          Container(
            color: Colors.red.withOpacity(0.5),
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(20),
            child: ListTile(
              title: const Text(
                'Ingresar sin cuenta',
                style: TextStyle(fontSize:20,
                  color: Colors.black,fontFamily: 'letra',
                  fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text("Ingresar",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>TiendApp()),
                    );
                },
              )
          ),
        ],
      ),
    );
  }
}
