<?php

    require "conexion.php";

    $id_empleado = $_POST['id_empleado'];
    $id_empresa = $_POST['id_empresa'];
    $nombre_empleado = $_POST['nombre_empleado'];
    $apellido_empleado = $_POST['apellido_empleado'];
    $direccion_empleado = $_POST['direccion_empleado'];
    $telefono_empleado = $_POST['telefono_empleado'];


    $sql = "UPDATE empleado SET id_empresa='$id_empresa', nombre_empleado='$nombre_empleado', apellido_empleado='$apellido_empleado', direccion_empleado='$direccion_empleado', telefono_empleado='$telefono_empleado' WHERE id_empleado='$id_empleado'";

    $query = $mysqli->query($sql);
?>
