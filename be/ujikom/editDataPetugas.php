<?php
include'conn.php';

$id_petugas = $_POST['id_petugas'];
$nama_petugas = $_POST['nama_petugas'];
$username = $_POST['username'];
$password = $_POST['password'];
$role = $_POST['role'];

$connect->query("UPDATE `tb_petugas` 
SET nama_petugas='".$nama_petugas."', 
username='".$username."', 
password='".$password."',
role='".$role."'
WHERE id_petugas=".$id_petugas
);
?>
