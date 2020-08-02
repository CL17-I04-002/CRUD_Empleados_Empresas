<?php

    require "conexion.php";

    $id_empleado = $_POST['id_empleado'];

    $sql = "DELETE FROM empleado WHERE id_empleado='$id_empleado'";
    $query = $mysqli->query($sql);

?>
