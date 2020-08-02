import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'editar_empleado.dart';

class DetallesEmpleado extends StatefulWidget{
  int index;
  List lista;
  DetallesEmpleado({this.index, this.lista});

  @override
  _DetallesEmpleadoState createState() => _DetallesEmpleadoState();

}

class _DetallesEmpleadoState extends State<DetallesEmpleado>{
  @override
  Widget build(BuildContext context){
    ///TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("DETALLES DEL EMPLEADO"),
      ),

      body: new Container(
          padding: EdgeInsets.all(10.0),
          child: new Center(
            child: Column(
              children: <Widget>[
                new Text(
                  "ID Empleado: " + widget.lista[widget.index]['id_empleado'],
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),


                new Text(
                  "ID Empresa: " + widget.lista[widget.index]['id_empresa'],
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),



                new Text(
                  "Nombre: " + widget.lista[widget.index]['nombre_empleado'],
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                new Text(
                  "Apellido: " + widget.lista[widget.index]['apellido_empleado'],
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                new Text(
                  "Direccion: " + widget.lista[widget.index]['direccion_empleado'],
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                new Text(
                  "Telefono: " + widget.lista[widget.index]['telefono_empleado'],
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),


                new RaisedButton(
                  child: Text("EDITAR"),
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      new MaterialPageRoute(builder: (BuildContext context)=> new EditarEmleado(
                        lista: widget.lista,
                        index: widget.index,
                      ),
                      ),
                    );
                  },
                ),

                new RaisedButton(
                  child: Text("BORRAR"),
                  onPressed: (){
                    var url ="http://127.0.0.1:90/directenglish/crudphp/empleado/eliminarEmpleado.php";
                    http.post(url, body: {
                      "id_empleado": widget.lista[widget.index]['id_empleado']
                    });

                    Navigator.of(context).pop();
                  },
                ),

              ],
            ),
          )
      ),
    );
  }
}