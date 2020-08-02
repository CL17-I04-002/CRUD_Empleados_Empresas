import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditarEmleado extends StatefulWidget{
  final List lista;
  int index;
  EditarEmleado({this.index, this.lista});

  @override
  _EditarEmpleadoState createState() => _EditarEmpleadoState();

}

class _EditarEmpleadoState extends State<EditarEmleado>{

  TextEditingController controlIdEmpresa = new TextEditingController();
  TextEditingController controlNombreEmpleado = new TextEditingController();
  TextEditingController controlApellidoEmpleado = new TextEditingController();
  TextEditingController controlDireccionEmpleado = new TextEditingController();
  TextEditingController controlTelefonoEmpleado = new TextEditingController();

  @override
  Widget build(BuildContext context){
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("EDITAR EMPRESA"),
        ),

        body: new Container(
          padding: EdgeInsets.all(10.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text(
                    "ID: " + widget.lista[widget.index]['id_empleado']
                ),
                new TextField(
                  controller: controlIdEmpresa,
                  decoration: new InputDecoration(
                      labelText: "Id Empresa"
                  ),
                ),

                new TextField(
                  controller: controlNombreEmpleado,
                  decoration: new InputDecoration(
                      labelText: "Nombre"
                  ),
                ),


                new TextField(
                  controller: controlApellidoEmpleado,
                  decoration: new InputDecoration(
                      labelText: "Apellido"
                  ),
                ),

                new TextField(
                  controller: controlDireccionEmpleado,
                  decoration: new InputDecoration(
                      labelText: "Direccion"
                  ),
                ),



                new TextField(
                  controller: controlTelefonoEmpleado,
                  decoration: new InputDecoration(
                      labelText: "Telefono"
                  ),
                ),


                new RaisedButton(
                  child: Text("Editar Empleado"),
                  onPressed: (){
                    editarEmpleado();
                    Navigator.of(context).pop();

                  },
                ),
              ],
            ),
          ),
        )
    );
  }
  void editarEmpleado(){
    var url="http://127.0.0.1:90/directenglish/crudphp/empleado/editarEmpleado.php";
    http.post(url, body: {
      "id_empleado": widget.lista[widget.index]['id_empleado'],
      "id_empresa": controlIdEmpresa.text,
      "nombre_empleado": controlNombreEmpleado.text,
      "apellido_empleado": controlApellidoEmpleado.text,
      "direccion_empleado": controlDireccionEmpleado.text,
      "telefono_empleado": controlTelefonoEmpleado.text,
    });
  }
}