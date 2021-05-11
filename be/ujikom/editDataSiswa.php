<?php
include 'conn.php';

$nisn = $_POST['nisn'];
$nis = $_POST['nis'];
$password = $_POST['password'];
$nama_siswa = $_POST['nama_siswa'];
$alamat = $_POST['alamat'];
$no_telp = $_POST['no_telp'];

$connect->query("UPDATE `tb_siswa` SET 
    `nama_siswa` = '".$nama_siswa."', 
    `id_class` = '1', 
    `alamat` = '".$alamat."', 
    `no_telp` = '".$no_telp."' 
        WHERE `tb_siswa`.`nisn` = '".$nisn."'");
$connect->query("UPDATE `tb_login_siswa` SET 
    `password` = '".$password."'
        WHERE `tb_login_siswa`.`nis` = '".$nis."'");
?>