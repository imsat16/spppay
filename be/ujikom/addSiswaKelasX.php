<?php
include 'conn.php';

$nisn = $_POST['nisn'];
$nis = $_POST['nis'];
$password = $_POST['password'];
$nama_siswa = $_POST['nama_siswa'];
// $kelas = $_POST['nama_kelas'];
// $jurusan = $_POST['komp_keahlian'];
// $jenkel = $_POST['jenkel'];
$alamat = $_POST['alamat'];
$no_telp = $_POST['no_telp'];
// $status = $_POST['status'];

// 1 XI Tik
// 2 XI TBSM
// 3 XI RPL 
// 4 XI TKJ 
// 5 XII RPL 
// 6 XII TKJ 
$connect->query(
    "INSERT INTO tb_siswa (
    nisn,
    nis,
    nama_siswa,
    alamat,
    no_telp,
    id_class,
    jenis_kelamin,
    siswa_status
    ) VALUES (
        '" . $nisn . "',
        '" . $nis . "',
        '" . $nama_siswa . "',
        '" . $alamat . "',
        '" . $no_telp . "',
        5,
        'pria',
        'Aktif'
        )"
);
$connect->query(
    "INSERT INTO tb_login_siswa(
    nis,
    password
    ) VALUES (
        '" . $nis . "',
        '" . $password . "'
        )"
);
?>