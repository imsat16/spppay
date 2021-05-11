<?php
    include 'conn.php';
    $id_petugas=$_POST['id_petugas'];
    $connect->query("DELETE FROM tb_petugas WHERE id_petugas=".$id_petugas);
?>