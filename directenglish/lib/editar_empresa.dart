import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditarEmpresa extends StatefulWidget{
  final List lista;
  int index;
  EditarEmpresa({this.index, this.lista});

  @override
  _EditarEmpresaState createState() => _EditarEmpresaState();

}

class _EditarEmpresaState extends State<EditarEmpresa>{

  TextEditingController controlNombreEpresa = new TextEditingController();
  TextEditingController controlDireccionEmpresa = new TextEditingController();
  TextEditingController controlTelefonoEmpresa = new TextEditingController();
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
                    "ID: " + widget.lista[widget.index]['id_empresa']
                ),
                new TextField(
                  controller: controlNombreEpresa,
                  decoration: new InputDecoration(
                      labelText: "Nombre"
                  ),
                ),

                new TextField(
                  controller: controlDireccionEmpresa,
                  decoration: new InputDecoration(
                      labelText: "Direccion"
                  ),
                ),


                new TextField(
                  controller: controlTelefonoEmpresa,
                  decoration: new InputDecoration(
                      labelText: "Telefono"
                  ),
                ),

                new RaisedButton(
                  child: Text("Editar Empresa"),
                  onPressed: (){
                    editarEmpresa();
                    Navigator.of(context).pop();

                  },
                ),
              ],
            ),
          ),
        )
    );
  }
  void editarEmpresa(){
    var url="http://127.0.0.1:90/directenglish/crudphp/empresa/editarEmpresa.php";
    http.post(url, body: {
      "idUsuario": widget.lista[widget.index]['idUsuario'],
      "nombre": controlNombreEpresa.text,
      "telefono": controlDireccionEmpresa.text,
      "email": controlTelefonoEmpresa.text
    });
  }
}