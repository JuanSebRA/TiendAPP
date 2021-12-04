
import 'package:flutter/material.dart';
import 'buscar.dart';
import 'clientes.dart';
import 'compra.dart';
import 'favorito.dart';
import 'lista.dart';
import 'menu.dart';
import 'notificaciones.dart';

class TiendApp extends StatelessWidget {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Tienda',
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('BlackFolder/14.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(child: const Text('TiendApp',
              style: TextStyle(fontSize:30,
                color: Colors.black,fontFamily: 'letra',
                fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,
                //decoration: TextDecoration.underline,
                //decorationColor: Colors.white,
                //decorationStyle: TextDecorationStyle.dashed
              ),
            )
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.only(bottom: 80),
            children: <Widget>[
              Container(
                color: Colors.blue.withOpacity(0.5),
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(20),
                child: ListTile(
                  title: const Text(
                    'Bienvenido a nuestra App',
                    style: TextStyle(fontSize:20,
                      color: Colors.black,fontFamily: 'letra',
                      fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
                    ),
                  ),
                  subtitle: Text('Encuentra los mejores precios y descuentos',
                    style: TextStyle(fontSize: 15,color: Colors.red),
                  ),
                  leading: Icon(
                    Icons.add_business,
                    color: Colors.red,
                    size: 50,
                  ),
                ),
              ),
              Container(
                color: Colors.green.withOpacity(0.5),
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.all(20),
                child: ListTile(
                  title: const Text(
                    'Lista de marcas y productos',
                    style: TextStyle(fontSize:20,
                      color: Colors.black,fontFamily: 'letra',
                      fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
                    ),
                  ),
                  subtitle: Text('Encuentra variedad en productos y servicios',
                    style: TextStyle(fontSize: 15,color: Colors.blueAccent),
                  ),
                  leading: IconButton(
                    icon: Icon(
                      Icons.add_shopping_cart_sharp,
                    ),
                    iconSize: 50,
                    color: Colors.blueAccent,
                    splashColor: Colors.purple,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>lista()),
                      );
                    },
                  ),
                ),
              ),
              Container(
                color: Colors.deepPurple.withOpacity(0.5),
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(20),
                child: ListTile(
                  title: const Text(
                    'Elige los productos y servicios',
                    style: TextStyle(fontSize:20,
                      color: Colors.black,fontFamily: 'letra',
                      fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
                    ),
                  ),
                  subtitle: Text('Conoce los detalles y opciones disponibles',
                    style: TextStyle(fontSize: 15,color: Colors.pink),
                  ),
                  leading: IconButton(
                    icon: Icon(
                      Icons.assignment,
                    ),
                    iconSize: 50,
                    color: Colors.pink,
                    splashColor: Colors.red,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>compra()),
                      );
                    },
                  ),
                ),
              ),
              Container(
                color: Colors.redAccent.withOpacity(0.5),
                margin: EdgeInsets.only(top: 45),
                padding: EdgeInsets.all(20),
                child: ListTile(
                  title: const Text(
                    'Registrese Aqui',
                    style: TextStyle(fontSize:20,
                      color: Colors.black,fontFamily: 'letra',
                      fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,
                    ),
                  ),
                  subtitle: Text('Registrate y obten multiples beneficios',
                    style: TextStyle(fontSize: 15,color: Colors.grey),
                  ),
                  leading: Icon(
                    Icons.add_reaction_rounded,
                    color: Colors.black54,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: _showFab
              ? FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>Clientes()),
              );
            },
            child: const Icon(Icons.add),
            tooltip: 'Agregar Usuario',
          )
              : null,
          floatingActionButtonLocation: _fabLocation,
          bottomNavigationBar: _TiendApp(
            fabLocation: _fabLocation,
            shape: _showNotch ? const CircularNotchedRectangle() : null,
          ),
        ),
      ),
    );
  }
}

class _TiendApp extends StatelessWidget {
  const _TiendApp({
    this.fabLocation = FloatingActionButtonLocation.centerDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
  <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.black,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Menu',
              icon: const Icon(Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>menu()),
                );
              },
            ),
            IconButton(
              tooltip: 'Notificaciones',
              icon: const Icon(Icons.attach_email,
                color: Colors.blue,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>notificaciones()),
                );
              },
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Buscar',
              icon: const Icon(Icons.search,
                color: Colors.yellow,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>buscar()),
                );
              },
            ),
            IconButton(
              tooltip: 'Favoritos',
              icon: const Icon(Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>favorito()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

