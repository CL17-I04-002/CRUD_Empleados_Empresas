<?php

     require "conexion.php";

     $nombre_empresa = $_POST['nombre_empresa'];
     $direccion_empresa = $_POST['direccion_empresa'];
     $teléfono_empresa = $_POST['telefono_empresa'];

     $sql = "insert into empresa(nombre_empresa, direccion_empresa, telefono_empresa)VALUES('$nombre_empresa', '$direccion_empresa', '$teléfono_empresa')";

     $query = $mysqli->query($sql);
 ?>