<?php

    require "conexion.php";

    $id_empresa = $_POST['id_empresa'];
    $nombre_empresa = $_POST['nombre_empresa'];
    $direccion_empresa = $_POST['direccion_empresa'];
    $telefono_empresa = $_POST['telefono_empresa'];

    $sql = "UPDATE empresa SET nombre_empresa='$nombre_empresa', direccion_empresa='$direccion_empresa', telefono_empresa='$telefono_empresa' WHERE id_empresa='$id_empresa'";

    $query = $mysqli->query($sql);
?>
