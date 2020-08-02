import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgregarEmpleado extends StatefulWidget{
  @override
  _AgregarEmpleadoState createState() => _AgregarEmpleadoState();
}

class _AgregarEmpleadoState extends State<AgregarEmpleado>{

  TextEditingController controlIdEmpresa = new TextEditingController();
  TextEditingController controlNombreEmpleado = new TextEditingController();
  TextEditingController controlApellidoEmpleado = new TextEditingController();
  TextEditingController controlDireccionEmpleado = new TextEditingController();
  TextEditingController controlTelefonoEmpleado = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("AGREGAR EMPLEADO"),
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[

              new TextField(
                controller: controlIdEmpresa,
                decoration: new InputDecoration(
                    labelText: "id_empresa"
                ),
              ),

              new TextField(
                controller: controlNombreEmpleado,
                decoration: new InputDecoration(
                    labelText: "nombre_empleado"
                ),
              ),

              new TextField(
                controller: controlApellidoEmpleado,
                decoration: new InputDecoration(
                    labelText: "apellido_empleado"
                ),
              ),

              new TextField(
                controller: controlDireccionEmpleado,
                decoration: new InputDecoration(
                    labelText: "direccion_empleado"
                ),
              ),


              new TextField(
                controller: controlTelefonoEmpleado,
                decoration: new InputDecoration(
                    labelText: "telefono_empleado"
                ),
              ),


              new RaisedButton(
                child: new Text("Agregar Empleado"),
                onPressed: () {
                  agregarEmpleado();
                  Navigator.of(context).pop();
                },
              )

            ],
          ),
        ),
      ),
    );
  }
  void agregarEmpleado(){
    var url="http://127.0.0.1:90/directenglish/crudphp/empleado/agregarEmpleado.php";
    http.post(url, body: {
      "id_empresa": controlIdEmpresa.text,
      "nombre_empleado": controlNombreEmpleado.text,
      "apellido_empleado": controlApellidoEmpleado.text,
      "direccion_empleado": controlDireccionEmpleado.text,
      "telefono_empleado": controlTelefonoEmpleado.text,
    });
  }
}