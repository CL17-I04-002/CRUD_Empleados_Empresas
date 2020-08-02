import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgregarEmpresa extends StatefulWidget{
  @override
  _AgregarEmpresaState createState() => _AgregarEmpresaState();
}

class _AgregarEmpresaState extends State<AgregarEmpresa>{

  TextEditingController controlNombreEpresa = new TextEditingController();
  TextEditingController controlDireccionEmpresa = new TextEditingController();
  TextEditingController controlTelefonoEmpresa = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("AGREGAR EMPRESA"),
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[

              new TextField(
                controller: controlNombreEpresa,
                decoration: new InputDecoration(
                    labelText: "nombre_empresa"
                ),
              ),

              new TextField(
                controller: controlDireccionEmpresa,
                decoration: new InputDecoration(
                    labelText: "direccion_empresa"
                ),
              ),

              new TextField(
                controller: controlTelefonoEmpresa,
                decoration: new InputDecoration(
                    labelText: "teléfono_empresa"
                ),
              ),

              new RaisedButton(
                child: new Text("Agregar Empresa"),
                onPressed: () {
                  agregarEmpresa();
                  Navigator.of(context).pop();
                },
              )

            ],
          ),
        ),
      ),
    );
  }
  void agregarEmpresa(){
    var url="http://127.0.0.1:90/directenglish/crudphp/empresa/agregarEmpresa.php";
    http.post(url, body: {
      "nombre_empresa": controlNombreEpresa.text,
      "direccion_empresa": controlDireccionEmpresa.text,
      "teléfono_empresa": controlTelefonoEmpresa.text,
    });
  }
}