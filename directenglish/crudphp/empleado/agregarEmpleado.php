<?php
     require "conexion.php";

     $id_empresa = $_POST['id_empresa'];
     $nombre_empleado = $_POST['nombre_empleado'];
     $apellido_empleado = $_POST['apellido_empleado'];
     $direccion_empleado = $_POST['direccion_empleado'];
     $telefono_empleado = $_POST['telefono_empleado'];

     $sql = "insert into empleado(id_empresa, nombre_empleado, apellido_empleado, direccion_empleado, telefono_empleado)VALUES('$id_empresa', '$nombre_empleado', '$apellido_empleado', '$direccion_empleado', $telefono_empleado)";

     $query = $mysqli->query($sql);
 ?>