<?php
include 'conn.php';
$nisn = $_POST['nisn'];
$nis = $_POST['nis'];

$query3 = $connect->query("DELETE FROM `tb_spp` WHERE `tb_spp`.`id_spp` = '" . $id_spp . "'");
$query2 = $connect->query("DELETE FROM `tb_login_siswa` WHERE `tb_login_siswa`.`nis` = '" . $nis . "'");
$query1 = $connect->query("DELETE FROM `tb_siswa` WHERE `tb_siswa`.`nisn` = '" . $nisn . "'");
