<?php
include'conn.php';

$nama_petugas = $_POST['nama_petugas'];
$username = $_POST['username'];
$password = $_POST['password'];
$role = 'petugas';

$connect->query(
    "INSERT INTO tb_petugas(
        nama_petugas,
        username,
        password,
        role
        ) 
        VALUES(
            '".$nama_petugas."',
            '".$username."',
            '".$password."',
            '".$role."'
            )"
    );
    // echo json_encode("Berhasil");
?>