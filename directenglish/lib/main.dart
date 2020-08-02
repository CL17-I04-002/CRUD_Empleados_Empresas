import 'package:directenglish/agregar_empleado.dart';
import 'package:directenglish/detalles_empleado.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'agregar_empresa.dart';
import 'detalles_empresa.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ListaEmpresas(),
    );
  }
}

class ListaEmpresas extends StatefulWidget {
  @override
  _ListaEmpresasState createState() => _ListaEmpresasState();
}

class _ListaEmpresasState extends State<ListaEmpresas> {

  Future<List> obtenerEmpresas() async {
    final response = await http.get("http://127.0.0.1:90/directenglish/crudphp/empresa/obtenerEmpresa.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("LISTA DE EMPRESAS"),
      ),

      body: new FutureBuilder<List> (
        future: obtenerEmpresas(),
        builder: (context, snapshot) {
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ElementoLista(
            lista: snapshot.data,
          )
              : new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),

      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
            new MaterialPageRoute(builder: (BuildContext context) => new AgregarEmpresa(),
            )
        ),
      ),
    );
  }
}

class ElementoLista extends StatelessWidget {

  final List lista;

  ElementoLista({ this.lista });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
      itemCount: lista == null ? 0 : lista.length,
      itemBuilder: (context, posicion) {
        return new Container(
          padding: EdgeInsets.all(2.0),
          child: new GestureDetector(
            onTap: () {

              Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new DetallesEmpresa(
                      index: posicion,
                      lista: lista,
                    ),
                  )
              );
            },

            child: new Card(
              color: Colors.deepPurple,
              child: new Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  lista[posicion]['id_empresa']+": "+lista[posicion]['nombre_empresa'],
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),

          ),
        );
      },
    );
  }
}

class ListaEmpleados extends StatefulWidget {
  @override
  _ListaEmppleadosState createState() => _ListaEmppleadosState();
}

class _ListaEmppleadosState extends State<ListaEmpleados> {

  Future<List> obtenerEmpleados() async {
    final response = await http.get("http://127.0.0.1:90/directenglish/crudphp/empleado/obtenerEmpleado.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("LISTA DE EMPLEADOS"),
      ),

      body: new FutureBuilder<List> (
        future: obtenerEmpleados(),
        builder: (context, snapshot) {
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ElementoLista(
            lista: snapshot.data,
          )
              : new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),

      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
            new MaterialPageRoute(builder: (BuildContext context) => new AgregarEmpleado(),
            )
        ),
      ),
    );
  }
}
class ElementoLista2 extends StatelessWidget {

  final List lista;

  ElementoLista2({ this.lista });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
      itemCount: lista == null ? 0 : lista.length,
      itemBuilder: (context, posicion) {
        return new Container(
          padding: EdgeInsets.all(2.0),
          child: new GestureDetector(
            onTap: () {

              Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new DetallesEmpleado(
                      index: posicion,
                      lista: lista,
                    ),
                  )
              );
            },

            child: new Card(
              color: Colors.deepPurple,
              child: new Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  lista[posicion]['id_empleado']+": "+lista[posicion]['nombre_empleado'],
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),

          ),
        );
      },
    );
  }
}