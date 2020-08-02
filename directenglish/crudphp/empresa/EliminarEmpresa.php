<?php

    require "conexion.php";

    $id_empresa = $_POST['id_empresa'];

    $sql = "DELETE FROM empresa WHERE id_empresa='$id_empresa'";
    $query = $mysqli->query($sql);

?>
