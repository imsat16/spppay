<?php
include 'conn.php';

$awalan = "SPP";
$lebar = 7;

$auto = $connect->query("SELECT id_spp FROM tb_spp ORDER BY id_spp DESC LIMIT 1");
$jumlah_record = mysqli_num_rows($auto);
if ($jumlah_record == 0) {
    $nomor = 1;
} else {
    $row = mysqli_fetch_array($auto);
    $nomor = intval(substr($row[0], strlen($awalan))) + 1;
}
if ($lebar > 0) {
    $angka = $awalan . str_pad($nomor, $lebar, "0", STR_PAD_LEFT);
} else {
    $angka = $awalan . $nomor;
}

$id = $angka;
$nisn = $_POST['nisn'];
$nis = $_POST['nis'];
$password = $_POST['password'];
$nama = $_POST['nama_siswa'];
$id_kelas = $_POST['id_class'];
$jenkel = $_POST['jenis_kelamin'];
$alamat = $_POST['alamat'];
$no_telp = $_POST['no_telp'];

$ajaran = date("Y");
$ajaran_two = date("Y") + 1;
$tahunajaran = $ajaran . "/" . $ajaran_two;

$aktif = 'Aktif';



// $thn = $_POST['thn'];
$connect->query("INSERT INTO tb_siswa (nisn,nis,nama_siswa,alamat,no_telp,id_class,jenis_kelamin,siswa_status) VALUES ('" . $nisn . "','" . $nis . "','" . $nama . "','" . $alamat . "','" . $no_telp . "','" . $id_kelas . "','" . $jenkel . "','" . $aktif . "')");
$connect->query("INSERT INTO tb_login_siswa (nis,password) VALUES ('" . $nis . "','" . $password . "')");
// $connect->query("INSERT INTO tb_spp (id_spp,nisn,januari,februari,maret,april,mei,juni,juli,agustus,september,oktober,november,desember,status,thn) VALUES ('','" . $nisn . "','300000','300000','300000','300000','300000','300000','300000','300000','300000','300000','300000','300000','belum_lunas','" . $thn . "')");

$connect->query("INSERT INTO tb_spp (id_spp,nisn,spp_januari,spp_februari,spp_maret,spp_april,spp_mei,spp_juni,spp_juli,spp_agustus,spp_september,spp_oktober,spp_november,spp_desember,status,tahun_ajaran) VALUES ('" . $id . "','" . $nisn . "', 300000, 300000, 300000, 300000, 300000, 300000, 300000, 300000, 300000, 300000, 300000, 300000, 'belum_lunas', '" . $tahunajaran . "')");
